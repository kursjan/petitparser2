Class {
	#name : #PP2SmalltalkParser,
	#superclass : #PP2SmalltalkGrammar,
	#category : 'PetitParser2-Smalltalk-Core'
}

{ #category : #private }
PP2SmalltalkParser >> addStatements: aCollection into: aNode [
	aCollection isNil 
		ifTrue: [ ^ aNode ].
	aCollection do: [ :each |
		each class == PP2SmalltalkToken
			ifFalse: [ aNode addNode:  each ]
			ifTrue: [
				aNode statements isEmpty
					ifTrue: [ aNode pp2AddComments: each comments ]
					ifFalse: [ aNode statements last pp2AddComments: each comments ].
				aNode periods: (aNode periods asOrderedCollection
					addLast: each start;
					yourself) ] ].
	^ aNode
]

{ #category : #grammar }
PP2SmalltalkParser >> array [
	^ super array map: [ :openNode :statementNodes :closeNode |
		(self buildArray: statementNodes)
			left: openNode start;
			right: closeNode start;
			yourself ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> arrayLiteral [
	^ super arrayLiteral
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: false ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> arrayLiteralArray [
	^ super arrayLiteralArray
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: false ]
]

{ #category : #'grammar-messages' }
PP2SmalltalkParser >> binaryExpression [
	^ super binaryExpression map: [ :receiverNode :messageNodes | self build: receiverNode messages: messageNodes ]
]

{ #category : #token }
PP2SmalltalkParser >> binaryToken [
	^ super binaryToken
		==> [ :token | 
			(RBBinarySelectorToken value: token value start: token start)
				comments: token comments;
				yourself ]
]

{ #category : #'grammar-blocks' }
PP2SmalltalkParser >> block [
	^ super block map: [ :leftToken :blockNode :rightToken | blockNode left: leftToken start; right: rightToken start ]
]

{ #category : #'grammar-blocks' }
PP2SmalltalkParser >> blockArgument [
	^ super blockArgument ==> #second
]

{ #category : #'grammar-blocks' }
PP2SmalltalkParser >> blockBody [
	^ super blockBody
		==> [ :nodes | 
			| result |
			result := RBBlockNode arguments: nodes first first body: nodes last.
			nodes first last ifNotNil: [ result bar: nodes first last start ].
			result ]
]

{ #category : #private }
PP2SmalltalkParser >> build: aNode assignment: anArray [
	^ anArray isEmpty
		ifTrue: [ aNode ]
		ifFalse: [
			anArray reverse 
				inject: aNode
				into: [ :result :each |
					RBAssignmentNode 
						variable: each first
						value: result
						position: each second start ] ]
]

{ #category : #private }
PP2SmalltalkParser >> build: aNode cascade: anArray [ 
	| messages semicolons |
	^ (anArray isNil or: [ anArray isEmpty ]) 
		ifTrue: [ aNode ]
		ifFalse: [
			messages := OrderedCollection new: anArray size + 1.
			messages addLast: aNode.
			semicolons := OrderedCollection new.
			anArray do: [ :each | 
				messages addLast: (self 
					build: aNode receiver
					messages: (Array with: each second)).
				semicolons addLast: each first start ].
			RBCascadeNode messages: messages semicolons: semicolons ]
]

{ #category : #private }
PP2SmalltalkParser >> build: aNode messages: anArray [
	^ (anArray isNil or: [ anArray isEmpty ])
		ifTrue: [ aNode ]
		ifFalse: [ 
			anArray
				inject: aNode
				into: [ :rec :msg | 
					msg isNil
						ifTrue: [ rec ]
						ifFalse: [ 
							RBMessageNode
								receiver: rec
								selector: (self buildSelector: msg first)
								keywordsPositions: (msg first collect: [ :each | each start ])
								arguments: msg second ] ] ]
]

{ #category : #private }
PP2SmalltalkParser >> build: aTempCollection sequence: aStatementCollection [
	| result |
	result := self
		addStatements: aStatementCollection
		into: RBSequenceNode new.
	aTempCollection isEmpty ifFalse: [
		result
			leftBar: aTempCollection first start
			temporaries: aTempCollection second
			rightBar: aTempCollection last start ].
	^ result
]

{ #category : #private }
PP2SmalltalkParser >> buildArray: aStatementCollection [
	^ self addStatements: aStatementCollection into: RBArrayNode new
]

{ #category : #private }
PP2SmalltalkParser >> buildMethod: aMethodNode [
	self flag: 'check this one thoroughly as it is unclear if the changes preserve 
	the original behavior from before the AST refactoring '.
"	aMethodNode selectorParts 
		do: [ :each | aMethodNode addComments: each comments ].
"	aMethodNode arguments
		do: [ :each | aMethodNode pp2AddComments: each comments ].
	aMethodNode pragmas do: [ :aPragma |
		aMethodNode pp2AddComments: aPragma comments.
		aMethodNode pp2AddComments: aPragma comments.
		aPragma arguments do: [ :each | 
			each isLiteralArray
				ifFalse: [ aMethodNode pp2AddComments: each comments ] ].
		aPragma comments: #() ].
	^ aMethodNode
]

{ #category : #private }
PP2SmalltalkParser >> buildSelector: anArray [
	^ (String streamContents: [ :stream | anArray do: [ :each | stream nextPutAll: each value ] ]) asSymbol
]

{ #category : #private }
PP2SmalltalkParser >> buildString: aString [ 
	(aString isEmpty or: [ aString first ~= $' or: [ aString last ~= $' ] ])
		ifTrue: [ ^ aString ].
	^ (aString 
		copyFrom: 2
		to: aString size - 1) 
		copyReplaceAll: ''''''
		with: ''''
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> byteLiteral [
	^ super byteLiteral
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: true ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> byteLiteralArray [
	^ super byteLiteralArray
		==> [ :nodes | 
			RBLiteralArrayNode
				startPosition: nodes first start
				contents: nodes second
				stopPosition: nodes last start
				isByteArray: true ]
]

{ #category : #'grammar-messages' }
PP2SmalltalkParser >> cascadeExpression [
	^ super cascadeExpression map: [ :receiverNode :messageNodes | self build: receiverNode cascade: messageNodes ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> charLiteral [
	^ super charLiteral
		==> [ :token | 
			(RBLiteralValueNode 
				value: token value second 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #grammar }
PP2SmalltalkParser >> expression [
	^ super expression map: [ :variableNodes :expressionNodes | self build: expressionNodes assignment: variableNodes ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> falseLiteral [
	^ super falseLiteral
		==> [ :token | 
			(RBLiteralValueNode 
				value: false 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #token }
PP2SmalltalkParser >> identifierToken [
	^ (super identifierToken
		==> [ :token | 
			(RBIdentifierToken value: token value start: token start)
				comments: token comments;
				yourself ])
		forbidCache;
		yourself
]

{ #category : #'grammar-messages' }
PP2SmalltalkParser >> keywordExpression [
	^ super keywordExpression map: [ :receiveNode :messageNode | self build: receiveNode messages: (Array with: messageNode) ]
]

{ #category : #token }
PP2SmalltalkParser >> keywordToken [
	^ super keywordToken
		==> [ :token | 
			(RBKeywordToken value: token value start: token start)
				comments: token comments;
				yourself ]
]

{ #category : #grammar }
PP2SmalltalkParser >> method [
	^ super method map: [ :methodNode :bodyNode | 
		methodNode pragmas: bodyNode first.
		methodNode body: bodyNode second.
		self buildMethod: methodNode ]
]

{ #category : #grammar }
PP2SmalltalkParser >> methodDeclaration [
	^ super methodDeclaration
		==> [ :nodes | 
			RBMethodNode
				selector: (self buildSelector: nodes first)
				keywordsPositions: (nodes first collect: [ :each | each start ])
				arguments: nodes second ]
]

{ #category : #grammar }
PP2SmalltalkParser >> methodSequence [
	^ super methodSequence map: [ :periodNodes1 :pragmaNodes1 :periodNodes2 :tempNodes :periodNodes3 :pragmaNodes2 :periodNodes4 :statementNodes |
		Array
			with: pragmaNodes1 , pragmaNodes2
			with: (self build: tempNodes sequence: periodNodes1 , periodNodes2 , periodNodes3 , periodNodes4 , statementNodes) ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> nilLiteral [
	^ super nilLiteral
		==> [ :token | 
			(RBLiteralValueNode 
				value: nil 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> numberLiteral [
	^ super numberLiteral
		==> [ :token | 
			(RBLiteralValueNode
				value: (Number readFrom: token value)
				start: token start
				stop: token stop
				source: token value)
				comments: token comments;
				yourself ]
]

{ #category : #grammar }
PP2SmalltalkParser >> parens [
	^ super parens map: [ :openToken :expressionNode :closeToken | expressionNode addParenthesis: (openToken start to: closeToken start) ]
]

{ #category : #grammar }
PP2SmalltalkParser >> pragma [
	^ super pragma
		==> [ :nodes | 
			(RBPragmaNode
				selector: (self buildSelector: nodes second first)
				keywordsPositions: (nodes second first collect: [ :each | each start ])
				arguments: nodes second second)
				pp2AddComments: nodes first comments;
				pp2AddComments: nodes last comments;
				left: nodes first start;
				right: nodes last start;
				yourself ]
]

{ #category : #grammar }
PP2SmalltalkParser >> return [
	^ super return map: [ :token :expressionNode | RBReturnNode return: token start value: expressionNode ]
]

{ #category : #grammar }
PP2SmalltalkParser >> sequence [
	^ super sequence map: [ :tempNodes :periodNodes :statementNodes | self build: tempNodes sequence: periodNodes , statementNodes ]
]

{ #category : #accessing }
PP2SmalltalkParser >> startExpression [
	"Make the sequence node has a method node as its parent and that the source is set."

	^ ([ :context | context contents ] asPParser and , super startExpression) map: [ :source :node | 
		(RBMethodNode selector: #doIt body: node)
			source: source.
		(node statements size = 1 and: [ node temporaries isEmpty ])
			ifTrue: [ node statements first ]
			ifFalse: [ node ] ]
]

{ #category : #accessing }
PP2SmalltalkParser >> startMethod [
	"Make sure the method node has the source code properly set."
	^ ([ :context | context upToEnd ] asPParser and, super startMethod)
		map: [ :source :node | node source: source ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> stringLiteral [
	^ super stringLiteral
		==> [ :token | 
			(RBLiteralValueNode 
				value: (self buildString: token value) 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> symbolLiteral [
	^ super symbolLiteral
		==> [ :tokens | 
			(RBLiteralValueNode
				value: (self buildString: tokens last value) asSymbol
				start: tokens first start
				stop: tokens last stop)
				comments: tokens last comments;
				yourself ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> symbolLiteralArray [
	^ super symbolLiteralArray
		==> [ :token | 
			(RBLiteralValueNode 
				value: (self buildString: token value) asSymbol 
				start: token start 
				stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkParser >> trueLiteral [
	^ super trueLiteral
		==> [ :token | 
			(RBLiteralValueNode value: true start: token start stop: token stop)
				comments: token comments;
				yourself ]
]

{ #category : #'grammar-messages' }
PP2SmalltalkParser >> unaryExpression [
	^ super unaryExpression map: [ :receiverNode :messageNodes | self build: receiverNode messages: messageNodes ]
]

{ #category : #token }
PP2SmalltalkParser >> unaryToken [
	^ super unaryToken
		==> [ :token | 
			(RBIdentifierToken value: token value start: token start)
				comments: token comments;
				yourself ]
]

{ #category : #grammar }
PP2SmalltalkParser >> variable [
	^ super variable ==> [ :token | RBVariableNode identifierNamed: token value  at: token start ]
]
