"
A parser that performs an action block upon activation with the stream and a continuation block.
"
Class {
	#name : #PP2WrappingNode,
	#superclass : #PP2AbstractActionNode,
	#category : #'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2WrappingNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitWrapping: self
]

{ #category : #testing }
PP2WrappingNode >> doesFunctionalChanges [
	^ self propertyAt: #functionalChanges
]

{ #category : #'analysis - first' }
PP2WrappingNode >> firstCharSet [
	^ self doesFunctionalChanges ifTrue: [ 
		PP2UnknownCharSetPredicate instance
	] ifFalse: [  
		child firstCharSet
	]
]

{ #category : #accessing }
PP2WrappingNode >> functionalChanges: aBoolean [
	self propertyAt: #functionalChanges put: aBoolean
]

{ #category : #initialization }
PP2WrappingNode >> initialize [
	super initialize.
	self functionalChanges: true.
]

{ #category : #'analysis - first' }
PP2WrappingNode >> isFirstSetTerminal [
	"lets be conservative here"
	self doesFunctionalChanges ifTrue: [  
		^ true
	].

	^ false

]

{ #category : #'parsing - private' }
PP2WrappingNode >> parseOn: context [
	^ strategy parseOn: context
]

{ #category : #initialization }
PP2WrappingNode >> resetStrategy [
	strategy := PP2Wrapping on: self
]
