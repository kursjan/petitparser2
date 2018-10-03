Class {
	#name : #PP2RecognizerVisitor,
	#superclass : #PP2NoopVisitor,
	#instVars : [
		'inToken',
		'parents'
	],
	#category : 'PetitParser2-Optimizations'
}

{ #category : #support }
PP2RecognizerVisitor >> changeStrategies: node [
	node allNodesDo: [ :child | 
		self assert: (child hasProperty: #recognizer).
		child recognizer ifTrue: [  
			child strategy: child strategy recognizer
		]
	]
]

{ #category : #caching }
PP2RecognizerVisitor >> context: node [
	^ PP2RecognizerContext new
		node: node;
		inToken: self inToken;
		parent: self currentContext node;
		yourself
]

{ #category : #optimizations }
PP2RecognizerVisitor >> doPass: node [
	self visit: node.
	self changeStrategies: node	
]

{ #category : #initialization }
PP2RecognizerVisitor >> inToken [
	^ inToken top
]

{ #category : #initialization }
PP2RecognizerVisitor >> initialize [
	super initialize.
	
	inToken := Stack with: false
]

{ #category : #visiting }
PP2RecognizerVisitor >> markNode: node [
	self inToken ifTrue: [  
		node markRecognizer.
	] ifFalse: [ 
		node markNoRecognizer.
	]
]

{ #category : #accessing }
PP2RecognizerVisitor >> parentsFor: node [
	^ parents at: node ifAbsentPut: [ IdentitySet new ]
]

{ #category : #caching }
PP2RecognizerVisitor >> rootContext [
	^ PP2RecognizerContext new
]

{ #category : #visiting }
PP2RecognizerVisitor >> visitAction: node [
	self inToken ifTrue: [  
		node warnActionInToken.
		inToken push: false.
		super visitAction: node.
		inToken pop.
	] ifFalse: [ 
		super visitAction: node
	]
]

{ #category : #visiting }
PP2RecognizerVisitor >> visitFlatten: node [
	self markNode: node.
	self visitRecognizer: node child
]

{ #category : #visiting }
PP2RecognizerVisitor >> visitPP2Node: node [
	self markNode: node.
	
	super visitPP2Node: node
]

{ #category : #visiting }
PP2RecognizerVisitor >> visitRecognizer: node [

	inToken push: true.
	self visit: node.
	inToken pop
]

{ #category : #visiting }
PP2RecognizerVisitor >> visitToken: node [
	self markNode: node.
	self visitRecognizer: node child
]

{ #category : #visiting }
PP2RecognizerVisitor >> visitTrimming: node [
	self markNode: node.
	self visitRecognizer: node trimmer.
	self visit: node child.
]
