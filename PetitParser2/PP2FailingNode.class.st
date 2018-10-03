Class {
	#name : #PP2FailingNode,
	#superclass : #PP2Node,
	#instVars : [
		'message'
	],
	#classInstVars : [
		'instance'
	],
	#category : 'PetitParser2-Nodes'
}

{ #category : #'as yet unclassified' }
PP2FailingNode class >> instance [
	instance isNil ifTrue: [ 
		instance := PP2FailingNode message: 'failing'
	].
	^ instance
]

{ #category : #'as yet unclassified' }
PP2FailingNode class >> message: aString [
	^ self new message: aString
]

{ #category : #visiting }
PP2FailingNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitFailing: self
]

{ #category : #analysis }
PP2FailingNode >> firstCharSet [
	^ PP2CharSetPredicate empty
]

{ #category : #comparing }
PP2FailingNode >> localEquals: anotherNode [
	(super localEquals: anotherNode) ifFalse: [ ^ false ].
	
	^ self message = anotherNode message
]

{ #category : #comparing }
PP2FailingNode >> localHash [
	^ super localHash bitXor: message hash
]

{ #category : #accessing }
PP2FailingNode >> message [
	^ message
]

{ #category : #accessing }
PP2FailingNode >> message: anObject [
	message := anObject
]

{ #category : #initialization }
PP2FailingNode >> resetStrategy [
	strategy := PP2Failing on: self
]
