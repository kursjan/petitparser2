Class {
	#name : #PP2SmalltalkWhitespaceNode,
	#superclass : #PP2Node,
	#classInstVars : [
		'instance'
	],
	#category : 'PetitParser2-Smalltalk-Core'
}

{ #category : #'instance creation' }
PP2SmalltalkWhitespaceNode class >> instance [
	instance isNil ifTrue: [ 
		instance := self new
	].
	"
		I would rather not to see this as a singleton
		
		The reason to reset is that optimizations set some strategies. And these will not get 
		restored.
	"
	instance resetStrategies.
	^ instance 
]

{ #category : #'instance creation' }
PP2SmalltalkWhitespaceNode class >> reset [
	instance := nil
]

{ #category : #visiting }
PP2SmalltalkWhitespaceNode >> accept: visitor [
	^ visitor visitSmalltalkWhitespace: self
]

{ #category : #initialization }
PP2SmalltalkWhitespaceNode >> initialize [
	super initialize.
	
	self resetStrategies.
]

{ #category : #'analysis - first' }
PP2SmalltalkWhitespaceNode >> isFirstSetTerminal [
	^ false
]

{ #category : #accessing }
PP2SmalltalkWhitespaceNode >> name [
	^ 'smalltalk_ws'
]

{ #category : #initialization }
PP2SmalltalkWhitespaceNode >> resetStrategy [
	strategy := PP2SmalltalkWhitespaceStrategy on: self
]
