"
Optimized version of PP2Context. When input fits into the memory, PP2InMemoryContext can be used, providing slightly better perfomance.
"
Class {
	#name : #PP2InMemoryContext,
	#superclass : #ReadStream,
	#traits : 'TPP2Context + TPP2Debuggable + TPP2Properties + TPP2Globals',
	#classTraits : 'TPP2Context classTrait + TPP2Debuggable classTrait + TPP2Properties classTrait + TPP2Globals classTrait',
	#instVars : [
		'parser',
		'properties',
		'globals',
		'returnValue',
		'startMemento'
	],
	#category : 'PetitParser2-Core'
}

{ #category : #'instance creation' }
PP2InMemoryContext class >> new [
	^ self basicNew initialize
]

{ #category : #'instance creation' }
PP2InMemoryContext class >> on: aCollection position: position [
	^ (self on: aCollection) 
		position: position;
		setAsStartState;
		yourself.

]

{ #category : #reparsing }
PP2InMemoryContext >> adoptString: newString [
	collection := newString.
	readLimit := newString size.
	self assert: readLimit isNotNil.
]

{ #category : #reparsing }
PP2InMemoryContext >> applyChange: change [
	change updateContext: self.
	change updateTokens: self returnValue.
	change updateParser: self parser
]

{ #category : #converting }
PP2InMemoryContext >> asPetit2Context [
	^ self
]

{ #category : #converting }
PP2InMemoryContext >> asPositionableStream [
	^ self
]

{ #category : #copying }
PP2InMemoryContext >> copyFrom: start to: end [
	"start - end should be in range <1, collection size> "
	^ collection copyFrom: start to: end
]

{ #category : #debugging }
PP2InMemoryContext >> debugResult [
	^ self globalAt: #debugResult ifAbsentPut: [ 
		| context |
		context := self copy.
		context restore: self startMemento.
		context parser duplicate enableDebug parseWithContext: context.
		context currentDebugResult
	]
]

{ #category : #'accessing-globals' }
PP2InMemoryContext >> globals [
	^ globals
]

{ #category : #'accessing-globals' }
PP2InMemoryContext >> globals: anObject [
	^ globals := anObject
]

{ #category : #initialization }
PP2InMemoryContext >> initialize [
	super initialize.
	
	self setAsStartState
]

{ #category : #testing }
PP2InMemoryContext >> isBuffered [
	^ false
]

{ #category : #testing }
PP2InMemoryContext >> isPetit2Context [
	^ true
]

{ #category : #tokenization }
PP2InMemoryContext >> newToken: tokenClass from: start [
	^ tokenClass 
		on: collection
		start: start + 1
		stop: position
]

{ #category : #accessing }
PP2InMemoryContext >> next: anInteger [ 
	| endPosition |

	endPosition := position + anInteger.
	^ (endPosition <= readLimit) ifTrue: [ 
		collection copyFrom: position+1 to: (position := endPosition).	
	] ifFalse: [  
		nil
	]
]

{ #category : #accessing }
PP2InMemoryContext >> nextFor: aCharacter [
	position == readLimit ifTrue: [ ^ false ].
	position := position + 1.
	^ (collection at: position) == aCharacter 
		ifTrue: [  true] 
		ifFalse: [position := position - 1 . false ]
]

{ #category : #accessing }
PP2InMemoryContext >> parser [
	^ parser
]

{ #category : #accessing }
PP2InMemoryContext >> parser: anObject [
	parser := anObject
]

{ #category : #accessing }
PP2InMemoryContext >> peek [
	"An improved version of peek, that is slightly faster than the built in version."

	^ self atEnd ifFalse: [ collection at: position + 1 ]
]

{ #category : #accessing }
PP2InMemoryContext >> position [
	^ position 
]

{ #category : #copying }
PP2InMemoryContext >> postCopy [
	super postCopy.
	
	globals := globals copy.
]

{ #category : #'accessing - properties' }
PP2InMemoryContext >> properties [
	^ properties
]

{ #category : #'accessing - properties' }
PP2InMemoryContext >> properties: newProperties [
	^ properties := newProperties
]

{ #category : #accessing }
PP2InMemoryContext >> readLimit [
	^ readLimit
]

{ #category : #memoization }
PP2InMemoryContext >> remember [
	^ PP2ContextMemento new
		stream: self;
		position: position;
		properties: self propertiesCopy;
		yourself.

]

{ #category : #memoization }
PP2InMemoryContext >> rememberPosition [
	^ position
]

{ #category : #initialization }
PP2InMemoryContext >> reset [
	super reset.

	globals := nil
]

{ #category : #memoization }
PP2InMemoryContext >> restore: contextMemento [
	position := contextMemento position.
	properties := contextMemento propertiesCopy.
]

{ #category : #memoization }
PP2InMemoryContext >> restorePosition: anInteger [
	position := anInteger 
]

{ #category : #accessing }
PP2InMemoryContext >> returnValue [
	^ returnValue
]

{ #category : #accessing }
PP2InMemoryContext >> returnValue: anObject [
	returnValue := anObject
]

{ #category : #'stream extras' }
PP2InMemoryContext >> shift [
	position := position + 1
]

{ #category : #'stream extras' }
PP2InMemoryContext >> shift: integer [
	position := position + integer
]

{ #category : #accessing }
PP2InMemoryContext >> startMemento [
	^ startMemento
]

{ #category : #accessing }
PP2InMemoryContext >> startMemento: anObject [
	startMemento := anObject
]

{ #category : #accessing }
PP2InMemoryContext >> stream [
	^ self
]

{ #category : #accessing }
PP2InMemoryContext >> stream: aPP2Stream [
	collection := aPP2Stream collection.
	readLimit := collection size.
	position := 0
]

{ #category : #'stream extras' }
PP2InMemoryContext >> uncheckedNext [
	position := position + 1.
	^ collection at: position
]

{ #category : #'stream extras' }
PP2InMemoryContext >> uncheckedPeek [
	^ collection at: position + 1
]

{ #category : #accessing }
PP2InMemoryContext >> upTo: character [
	"fast version using indexOf:"
	| start end |

	start := position+1.
	end := collection indexOf: character startingAt: start ifAbsent: [ 0 ].

	"not present--return rest of the collection"	
	(end = 0 or: [end > readLimit]) ifTrue: [ ^ self upToEnd ].

	"skip to the end and return the data passed over"
	position := end.
	^ collection copyFrom: start to: end
]

{ #category : #evaluating }
PP2InMemoryContext >> value [
	^ returnValue
]
