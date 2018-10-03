Class {
	#name : #PP2AbstractActionNode,
	#superclass : #PP2DelegateNode,
	#instVars : [
		'block'
	],
	#category : 'PetitParser2-Nodes'
}

{ #category : #'instance creation' }
PP2AbstractActionNode class >> on: node block: aBlock [
	^ self new
		child: node;
		block: aBlock;
		yourself
]

{ #category : #accessing }
PP2AbstractActionNode >> block [
	"Answer the action block of the receiver."

	^ block
]

{ #category : #accessing }
PP2AbstractActionNode >> block: anObject [
	block := anObject
]

{ #category : #comparing }
PP2AbstractActionNode >> localEquals: anotherNode [
	(super localEquals: anotherNode) ifFalse: [ ^ false ].
	
	^ (self block printString = anotherNode block printString)
]

{ #category : #comparing }
PP2AbstractActionNode >> localHash [
	^ super localHash bitXor: block printString hash
]

{ #category : #'parsing - private' }
PP2AbstractActionNode >> parseOn: context [
	^ strategy parseOn: context 
]
