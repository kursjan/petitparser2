Class {
	#name : #PP2FirstSetVisitor,
	#superclass : #PP2NoopVisitor,
	#instVars : [
		'terminalBlock',
		'predicateBlock',
		'leftRecursionAllowed'
	],
	#category : #'PetitParser2-Analysis'
}

{ #category : #'instance creation' }
PP2FirstSetVisitor class >> firstSet [
	^ self on: [ :e | e isFirstSetTerminal ] on: [ :e | e isFirstSetTerminal ]
]

{ #category : #'instance creation' }
PP2FirstSetVisitor class >> new [
	^ self firstSet
]

{ #category : #'instance creation' }
PP2FirstSetVisitor class >> on: aBlock [
	^ self basicNew initialize 
		terminalBlock: aBlock;
		predicateBlock: aBlock;
		yourself
]

{ #category : #'instance creation' }
PP2FirstSetVisitor class >> on: terminalBlock on: predicateBlock [
	^ self basicNew 
		terminalBlock: terminalBlock;
		predicateBlock: predicateBlock;
		initialize;
		yourself
]

{ #category : #'instance creation' }
PP2FirstSetVisitor class >> productionSet [
	^ self on: [ :e | e isFirstSetTerminal ] on: [ :e | e isProduction ]
]

{ #category : #'instance creation' }
PP2FirstSetVisitor class >> seasOrTerminalsSet [
	^ self 
		on: [ :e | e isSea or: [ e isFirstSetTerminal ] ] 
		on: [ :e | e isSea or: [ e isFirstSetTerminal ] ]
]

{ #category : #'instance creation' }
PP2FirstSetVisitor class >> tokenSet [
	^ self on: [ :e | e isToken or: [ e isFirstSetTerminal  ] ]
]

{ #category : #support }
PP2FirstSetVisitor >> addIfPossible: node to: collection [
	(predicateBlock value: node) ifTrue: [ collection add: node ]
]

{ #category : #initialization }
PP2FirstSetVisitor >> initialize [
	super initialize.
	
	leftRecursionAllowed := false
]

{ #category : #testing }
PP2FirstSetVisitor >> isTerminal: node [
	^ terminalBlock value: node
]

{ #category : #'loop control' }
PP2FirstSetVisitor >> openedResultFor: context [
	leftRecursionAllowed ifTrue: [ 
		^ super openedResultFor: context
	].


	"
		JK: I am not 100% sure, but this should never happen. If this happens, the grammar
		    contains an infinite loop.
	"
	self error: 'There seems to be a left recursive loop in your grammar!'
]

{ #category : #accessing }
PP2FirstSetVisitor >> predicateBlock [
	^ predicateBlock
]

{ #category : #accessing }
PP2FirstSetVisitor >> predicateBlock: anObject [
	predicateBlock := anObject
]

{ #category : #support }
PP2FirstSetVisitor >> setWithPossible: node [ 
	^ self setWithPossible: node withAll: #()
]

{ #category : #support }
PP2FirstSetVisitor >> setWithPossible: node withAll: aCollection [
	| set |
	set := IdentitySet withAll: aCollection.
	
	(predicateBlock value: node) ifTrue: [ 
		set add: node
	].

	^ set
]

{ #category : #accessing }
PP2FirstSetVisitor >> terminalBlock [
	^ terminalBlock
]

{ #category : #accessing }
PP2FirstSetVisitor >> terminalBlock: aBlock [
	terminalBlock := aBlock
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitAction: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitAdaptable: node [
	| set |
	set := (self setWithPossible: node).

	"Node can be adpated to anything"
	self addIfPossible: #any asPParser to: set.
	"We don't know if Epsilon is possible or not so we rather add it"
	self addIfPossible: PP2EpsilonNode instance to: set.
	
	^ set
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitAnd: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitChoice: node [
	| returnSet |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].
	
	returnSet := self setWithPossible: node.
	node children do: [ :child | 
		returnSet addAll: (self visit: child).
	].

	^ returnSet
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitComposite: node [
	^ self visitDelegate: node

]

{ #category : #visiting }
PP2FirstSetVisitor >> visitDelegate: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	^ self setWithPossible: node withAll: (self visit: node child) 

]

{ #category : #visiting }
PP2FirstSetVisitor >> visitEnd: node [
	^ self visitDelegate: node

]

{ #category : #visiting }
PP2FirstSetVisitor >> visitEndOfInput: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'I guess you have some issues with your terminal block.'
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitEndOfLine: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'I guess you have some issues with your terminal block.'
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitEpsilon: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'guess you have some issues with your terminal block'

]

{ #category : #visiting }
PP2FirstSetVisitor >> visitFailing: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'guess you have some issues with your terminal block'

]

{ #category : #visiting }
PP2FirstSetVisitor >> visitFlatten: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	^ self setWithPossible: node withAll: (self visit: node child) 

]

{ #category : #visiting }
PP2FirstSetVisitor >> visitLiteralObject: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'guess you have some issues with your terminal block'
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitLiteralSequence: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'guess you have some issues with your terminal block'
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitMapping: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	^ self setWithPossible: node withAll: (self visit: node child) 

]

{ #category : #visiting }
PP2FirstSetVisitor >> visitMatch: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitNewLine: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'I guess you have some issues with your terminal block.'
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitNonEpsilon: node [
	| set |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	set := (self setWithPossible: node).
	set addAll: (self visit: node child).
	set remove: PP2EpsilonNode instance ifAbsent: nil.
	
	^ set
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitNot: node [
	^ self visitDelegate: node

]

{ #category : #visiting }
PP2FirstSetVisitor >> visitOptional: node [
	| set |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	set := (self setWithPossible: node).
	set addAll: (self visit: node child).
	self addIfPossible: PP2EpsilonNode instance to: set.
	
	^ set
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitPP2Node: node [
	self error: 'should provide specific implementation'
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitPluggable: node [
	^ self visitDelegate: node

]

{ #category : #visiting }
PP2FirstSetVisitor >> visitPop: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitPossesiveRepeating: node [
	| set |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	set := self setWithPossible: node withAll: (self visit: node child).

	(node min = 0) ifTrue: [ 
		self addIfPossible: PP2EpsilonNode instance to: set.
	].

	^ set
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitPredicateObject: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'guess you have some issues with your terminal block'
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitPredicateSequence: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'guess you have some issues with your terminal block'
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitPush: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitSea: node [
	| returnSet |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	returnSet := (self setWithPossible: node).
	returnSet addAll: (self visit: node beforeWater).
	returnSet removeAllSuchThat: [ :e | e = #eoi asPParser ].
	returnSet addAll: (self visit: node island).
	node island isNullable ifTrue: [ 
		returnSet addAll: (self visit: node afterWater).
	].
		
	^ returnSet reject: [ :e | e isEpsilon ] 
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitSequence: node [
	| returnSet |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	returnSet := self setWithPossible: node.
	node children do: [ :child | 
		returnSet addAll: (self visit: child).
		child isNullable ifFalse: [ ^ returnSet reject: [ :e | e isEpsilon ] ]
	].

	self addIfPossible: PP2EpsilonNode instance to: returnSet.
	^ returnSet
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitStartOfLine: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'I guess you have some issues with your terminal block.'
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitToken: node [
	^ self visitDelegate: node

]

{ #category : #visiting }
PP2FirstSetVisitor >> visitTrimming: node [
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	^ (self setWithPossible: node) 
		addAll: ((self visit: node trimmer) reject: [ :e | e isEpsilon ]);
		addAll: (self visit: node child);
		yourself
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitWater: node [
	| retval lrStatus |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	lrStatus := leftRecursionAllowed.
	leftRecursionAllowed := true.

	retval := (self setWithPossible: node) 
		addAll: (self visit: node waterToken);
		addAll: (self visit: node boundary);
		yourself.
		
	leftRecursionAllowed := lrStatus.	
		
	^ retval
]

{ #category : #visiting }
PP2FirstSetVisitor >> visitWrapping: node [
	^ self visitDelegate: node
]

{ #category : #warnings }
PP2FirstSetVisitor >> warn: aMessage [
	Transcript crShow: aMessage.
	self error: 'this should not really happen.'.
]
