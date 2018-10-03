Trait {
	#name : #TPP2Context,
	#category : 'PetitParser2-Core'
}

{ #category : #reparsing }
TPP2Context >> applyChange: change [
	change updateContext: self.
	change updateTokens: self returnValue.
	change updateParser: self parser
]

{ #category : #debugging }
TPP2Context >> currentDebugResult [
	^ self globalAt: #debugResult ifAbsentPut: [ PP2DebugResult new context: self; yourself ]
]

{ #category : #debugging }
TPP2Context >> currentDebugResult: anObject [
	self globalAt: #debugResult put: anObject 
]

{ #category : #debugging }
TPP2Context >> debugResult [
	^ self globalAt: #debugResult ifAbsentPut: [ 
		self restore: self startMemento.
		self parser enableDebug parseWithContext: self.
		self currentDebugResult
	]
]

{ #category : #context }
TPP2Context >> defaultStack [
	^ self stackNamed: #defaultStack
]

{ #category : #testing }
TPP2Context >> isRecording [
	^ false
]

{ #category : #accessing }
TPP2Context >> parsedValue [
	"to provide some compatibility with PPToken"
	^ self returnValue
]

{ #category : #requirements }
TPP2Context >> position [
	self explicitRequirement
]

{ #category : #requirements }
TPP2Context >> returnValue [
	self explicitRequirement
]

{ #category : #requirements }
TPP2Context >> returnValue: anObject [
	self explicitRequirement
]

{ #category : #requirements }
TPP2Context >> setAsStartState [
	self startMemento: self remember
]

{ #category : #context }
TPP2Context >> stackNamed: identifier [
	^ self propertyAt: identifier ifAbsentPut: [ PP2Stack new ]
]

{ #category : #accessing }
TPP2Context >> start [
	^ self startMemento position
]

{ #category : #requirements }
TPP2Context >> startMemento [
	self explicitRequirement
]

{ #category : #requirements }
TPP2Context >> startMemento: contextMemento [
	self explicitRequirement
]

{ #category : #accessing }
TPP2Context >> stop [
	^ self position
]

{ #category : #seas }
TPP2Context >> waterPosition [
	^ self globalAt: #waterPosition ifAbsent: -1
]

{ #category : #seas }
TPP2Context >> waterPosition: anInteger [
	self globalAt: #waterPosition put: anInteger
]
