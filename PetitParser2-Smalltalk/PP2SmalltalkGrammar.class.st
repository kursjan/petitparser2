Class {
	#name : #PP2SmalltalkGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'array',
		'arrayItem',
		'arrayLiteral',
		'arrayLiteralArray',
		'assignment',
		'assignmentToken',
		'binary',
		'binaryExpression',
		'binaryMessage',
		'binaryMethod',
		'binaryPragma',
		'binaryToken',
		'block',
		'blockArgument',
		'blockArguments',
		'blockArgumentsWith',
		'blockArgumentsWithout',
		'blockBody',
		'byteLiteral',
		'byteLiteralArray',
		'cascadeExpression',
		'cascadeMessage',
		'char',
		'charLiteral',
		'charToken',
		'expression',
		'falseLiteral',
		'falseToken',
		'identifier',
		'identifierToken',
		'keyword',
		'keywordExpression',
		'keywordMessage',
		'keywordMethod',
		'keywordPragma',
		'keywordToken',
		'literal',
		'message',
		'method',
		'methodDeclaration',
		'methodSequence',
		'multiword',
		'nilLiteral',
		'nilToken',
		'number',
		'numberLiteral',
		'numberToken',
		'parens',
		'period',
		'periodToken',
		'pragma',
		'pragmaMessage',
		'pragmas',
		'primary',
		'return',
		'sequence',
		'startExpression',
		'startMethod',
		'statements',
		'string',
		'stringLiteral',
		'stringToken',
		'symbol',
		'symbolLiteral',
		'symbolLiteralArray',
		'temporaries',
		'trueLiteral',
		'trueToken',
		'unary',
		'unaryExpression',
		'unaryMessage',
		'unaryMethod',
		'unaryPragma',
		'unaryToken',
		'variable'
	],
	#category : 'PetitParser2-Smalltalk-Core'
}

{ #category : #testing }
PP2SmalltalkGrammar class >> allowUnderscoreAssignment [
	^ (Scanner respondsTo: #allowUnderscoreAsAssignment) and: [ Scanner allowUnderscoreAsAssignment ]
]

{ #category : #accessing }
PP2SmalltalkGrammar class >> parseExpression: aString [
	^ self new parseExpression: aString
]

{ #category : #accessing }
PP2SmalltalkGrammar class >> parseExpression: aString onError: aBlock [
	^ self new parseExpression: aString onError: aBlock
]

{ #category : #accessing }
PP2SmalltalkGrammar class >> parseMethod: aString [
	^ self new parseMethod: aString
]

{ #category : #accessing }
PP2SmalltalkGrammar class >> parseMethod: aString onError: aBlock [
	^ self new parseMethod: aString onError: aBlock
]

{ #category : #grammar }
PP2SmalltalkGrammar >> array [
	^ ${ asPParser smalltalkToken , (expression delimitedBy: periodToken) optional , $} asPParser smalltalkToken
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> arrayItem [
	^ literal / symbolLiteralArray / arrayLiteralArray / byteLiteralArray
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> arrayLiteral [
	^ '#(' asPParser smalltalkToken , arrayItem star , $) asPParser smalltalkToken
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> arrayLiteralArray [
	^ $( asPParser smalltalkToken , arrayItem star , $) asPParser smalltalkToken
]

{ #category : #grammar }
PP2SmalltalkGrammar >> assignment [
	^ variable , assignmentToken
]

{ #category : #token }
PP2SmalltalkGrammar >> assignmentToken [
	^ ':=' asPParser smalltalkToken
]

{ #category : #primitives }
PP2SmalltalkGrammar >> binary [
	^ (PP2PredicateObjectNode anyOf: '!%&*+,-/<=>?@\|~') plus
]

{ #category : #'grammar-messages' }
PP2SmalltalkGrammar >> binaryExpression [
	^ unaryExpression , binaryMessage star
]

{ #category : #'grammar-messages' }
PP2SmalltalkGrammar >> binaryMessage [
	^ (binaryToken , unaryExpression) ==> [ :nodes | 
		Array 
			with: (Array with: nodes first)
			with: (Array with: nodes second) ]
]

{ #category : #'grammar-methods' }
PP2SmalltalkGrammar >> binaryMethod [
	^ (binaryToken , variable) ==> [ :nodes | 
		Array 
			with: (Array with: nodes first)
			with: (Array with: nodes second) ]
]

{ #category : #'grammar-pragmas' }
PP2SmalltalkGrammar >> binaryPragma [
	^ (binaryToken , arrayItem) ==> [ :nodes | 
		Array 
			with: (Array with: nodes first)
			with: (Array with: nodes second) ]
]

{ #category : #token }
PP2SmalltalkGrammar >> binaryToken [
	^ binary smalltalkToken
]

{ #category : #'grammar-blocks' }
PP2SmalltalkGrammar >> block [
	^ $[ asPParser smalltalkToken , blockBody , $] asPParser smalltalkToken
]

{ #category : #'grammar-blocks' }
PP2SmalltalkGrammar >> blockArgument [
	^ $: asPParser smalltalkToken , variable
]

{ #category : #'grammar-blocks' }
PP2SmalltalkGrammar >> blockArguments [
	^ blockArgumentsWith / blockArgumentsWithout
]

{ #category : #'grammar-blocks' }
PP2SmalltalkGrammar >> blockArgumentsWith [
	^ blockArgument plus , ($| asPParser smalltalkToken / ($] asPParser smalltalkToken and ==> [ :node | nil ]))
]

{ #category : #'grammar-blocks' }
PP2SmalltalkGrammar >> blockArgumentsWithout [
	^ nil asPParser ==> [ :nodes | Array with: #() with: nil ]
]

{ #category : #'grammar-blocks' }
PP2SmalltalkGrammar >> blockBody [
	^ blockArguments , sequence
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> byteLiteral [
	^ '#[' asPParser smalltalkToken , numberLiteral star , $] asPParser smalltalkToken
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> byteLiteralArray [
	^ $[ asPParser smalltalkToken , numberLiteral star , $] asPParser smalltalkToken
]

{ #category : #'grammar-messages' }
PP2SmalltalkGrammar >> cascadeExpression [
	^ keywordExpression , cascadeMessage star
]

{ #category : #'grammar-messages' }
PP2SmalltalkGrammar >> cascadeMessage [
	^ $; asPParser smalltalkToken , message
]

{ #category : #primitives }
PP2SmalltalkGrammar >> char [
	^ $$ asPParser , #any asPParser
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> charLiteral [
	^ charToken
]

{ #category : #token }
PP2SmalltalkGrammar >> charToken [
	^ char smalltalkToken
]

{ #category : #grammar }
PP2SmalltalkGrammar >> expression [
	^ assignment star , cascadeExpression
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> falseLiteral [
	^ falseToken
]

{ #category : #token }
PP2SmalltalkGrammar >> falseToken [
	^ ('false' asPParser , #word asPParser not) smalltalkToken
]

{ #category : #primitives }
PP2SmalltalkGrammar >> identifier [
	| word letter |
	letter := (PP2PredicateObjectNode
				on: [ :each | each isLetter or: [ each = $_ ] ]
				message: 'letter expected').
				
	word := (PP2PredicateObjectNode
				on: [ :each | each isAlphaNumeric or: [ each = $_ ] ]
				message: 'letter or digit expected').
				
	^ (letter, word star)
]

{ #category : #token }
PP2SmalltalkGrammar >> identifierToken [
	^ identifier smalltalkToken
]

{ #category : #primitives }
PP2SmalltalkGrammar >> keyword [
	^ identifier , $: asPParser
]

{ #category : #'grammar-messages' }
PP2SmalltalkGrammar >> keywordExpression [
	^ binaryExpression , keywordMessage optional
]

{ #category : #'grammar-messages' }
PP2SmalltalkGrammar >> keywordMessage [
	^ (keywordToken , binaryExpression) plus ==> [ :nodes | 
		Array 
			with: (nodes collect: [ :each | each first ])
			with: (nodes collect: [ :each | each second ]) ]
]

{ #category : #'grammar-methods' }
PP2SmalltalkGrammar >> keywordMethod [
	^ (keywordToken , variable) plus ==> [ :nodes | 
		Array 
			with: (nodes collect: [ :each | each first ])
			with: (nodes collect: [ :each | each second ]) ]
]

{ #category : #'grammar-pragmas' }
PP2SmalltalkGrammar >> keywordPragma [
	^ (keywordToken , arrayItem) plus ==> [ :nodes | 
		Array 
			with: (nodes collect: [ :each | each first ])
			with: (nodes collect: [ :each | each second ]) ]
]

{ #category : #token }
PP2SmalltalkGrammar >> keywordToken [
	^ self keyword smalltalkToken
]

{ #category : #grammar }
PP2SmalltalkGrammar >> literal [
	^ numberLiteral / stringLiteral / charLiteral / arrayLiteral / byteLiteral / symbolLiteral / nilLiteral / trueLiteral / falseLiteral
]

{ #category : #grammar }
PP2SmalltalkGrammar >> message [
	^ keywordMessage / binaryMessage / unaryMessage
]

{ #category : #grammar }
PP2SmalltalkGrammar >> method [
	^ methodDeclaration , methodSequence
]

{ #category : #grammar }
PP2SmalltalkGrammar >> methodDeclaration [
	^ keywordMethod / unaryMethod / binaryMethod
]

{ #category : #grammar }
PP2SmalltalkGrammar >> methodSequence [
	^ periodToken star , pragmas , periodToken star , temporaries , periodToken star , pragmas , periodToken star , statements
]

{ #category : #primitives }
PP2SmalltalkGrammar >> multiword [
	^ keyword plus
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> nilLiteral [
	^ nilToken
]

{ #category : #token }
PP2SmalltalkGrammar >> nilToken [
	^ ('nil' asPParser , #word asPParser not) smalltalkToken
]

{ #category : #primitives }
PP2SmalltalkGrammar >> number [
	^ ($- asPParser optional , #digit asPParser) and , [ :context | 
		[ | stream retval |
			stream := context asPositionableStream.
		  	retval := (NumberParser on: stream) nextNumber.
			(context position: stream position)
				returnValue: retval;
				yourself
		] on: Error do: [ :err | context failure: err messageText ] 
	] asPParser
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> numberLiteral [
	^ numberToken
]

{ #category : #token }
PP2SmalltalkGrammar >> numberToken [
	^ number smalltalkToken
]

{ #category : #grammar }
PP2SmalltalkGrammar >> parens [
	^ $( asPParser smalltalkToken , expression , $) asPParser smalltalkToken
]

{ #category : #parsing }
PP2SmalltalkGrammar >> parseExpression: aString [ 
	^ self parseExpression: aString onError: [ :msg :pos | self error: msg ]
]

{ #category : #parsing }
PP2SmalltalkGrammar >> parseExpression: aString onError: aBlock [
	^ startExpression parse: aString onError: aBlock
]

{ #category : #parsing }
PP2SmalltalkGrammar >> parseMethod: aString [ 
	^ self parseMethod: aString onError: [ :msg :pos | self error: msg ]
]

{ #category : #parsing }
PP2SmalltalkGrammar >> parseMethod: aString onError: aBlock [
	^ startMethod parse: aString onError: aBlock
]

{ #category : #primitives }
PP2SmalltalkGrammar >> period [
	^ $. asPParser
]

{ #category : #token }
PP2SmalltalkGrammar >> periodToken [
	^ period smalltalkToken
]

{ #category : #grammar }
PP2SmalltalkGrammar >> pragma [
	^ $< asPParser smalltalkToken , pragmaMessage , $> asPParser smalltalkToken
]

{ #category : #'grammar-pragmas' }
PP2SmalltalkGrammar >> pragmaMessage [
	^ keywordPragma / unaryPragma / binaryPragma
]

{ #category : #grammar }
PP2SmalltalkGrammar >> pragmas [
	^ pragma star
]

{ #category : #grammar }
PP2SmalltalkGrammar >> primary [
	^ literal / variable / block / parens / array
]

{ #category : #grammar }
PP2SmalltalkGrammar >> return [
	^ $^ asPParser smalltalkToken , expression
]

{ #category : #grammar }
PP2SmalltalkGrammar >> sequence [
	^ temporaries , periodToken star , statements
]

{ #category : #accessing }
PP2SmalltalkGrammar >> start [
	"Default start production."

	^ startMethod
]

{ #category : #accessing }
PP2SmalltalkGrammar >> startExpression [
	"Start production for the expression."

	^ sequence end
]

{ #category : #accessing }
PP2SmalltalkGrammar >> startMethod [
	"Start production for the method."

	^ method end
]

{ #category : #grammar }
PP2SmalltalkGrammar >> statements [
	^ 	(expression wrapped , ((periodToken plus , statements ==> [ :nodes | nodes first , nodes last ])
								/ periodToken star)
			==> [ :nodes | (Array with: nodes first) , (nodes last) ])
	/	(return , periodToken star
			==> [ :nodes | (Array with: nodes first) , (nodes last) ])
	/	(periodToken star)
]

{ #category : #primitives }
PP2SmalltalkGrammar >> string [
	^ ($' asPParser , ('''''' asPParser / $' asPParser negate) star , $' asPParser)
		forbidCache;
		yourself
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> stringLiteral [
	^ stringToken
]

{ #category : #token }
PP2SmalltalkGrammar >> stringToken [
	^ string smalltalkToken
]

{ #category : #primitives }
PP2SmalltalkGrammar >> symbol [
	^ unary / binary / multiword / string
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> symbolLiteral [
	"This is totally fucked up: The Pharo compiler allows multiple #, arbitrary spaces between the # and the symbol, as well as comments inbetween. And yes, it is used."

	^ $# asPParser smalltalkToken plus , symbol smalltalkToken ==> [ :tokens | tokens first copyWith: tokens last ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> symbolLiteralArray [
	^ symbol smalltalkToken
]

{ #category : #grammar }
PP2SmalltalkGrammar >> temporaries [
	^ ($| asPParser smalltalkToken , variable star , $| asPParser smalltalkToken) optional ==> [ :nodes | nodes ifNil: [ #() ] ]
]

{ #category : #'grammar-literals' }
PP2SmalltalkGrammar >> trueLiteral [
	^ trueToken
]

{ #category : #token }
PP2SmalltalkGrammar >> trueToken [
	^ ('true' asPParser , #word asPParser not) smalltalkToken
]

{ #category : #primitives }
PP2SmalltalkGrammar >> unary [
	^ identifier , $: asPParser not
]

{ #category : #'grammar-messages' }
PP2SmalltalkGrammar >> unaryExpression [
	^ primary , unaryMessage star
]

{ #category : #'grammar-messages' }
PP2SmalltalkGrammar >> unaryMessage [
	^ unaryToken ==> [ :node | 
		Array 
			with: (Array with: node)
			with: Array new ]
]

{ #category : #'grammar-methods' }
PP2SmalltalkGrammar >> unaryMethod [
	^ identifierToken ==> [ :node | 
		Array 
			with: (Array with: node)
			with: Array new ]
]

{ #category : #'grammar-pragmas' }
PP2SmalltalkGrammar >> unaryPragma [
	^ identifierToken ==> [ :node | 
		Array 
			with: (Array with: node)
			with: (Array new) ]
]

{ #category : #token }
PP2SmalltalkGrammar >> unaryToken [
	^ unary smalltalkToken
]

{ #category : #grammar }
PP2SmalltalkGrammar >> variable [
	^ identifierToken
]
