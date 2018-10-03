Class {
	#name : #PP2CreateTokenNode,
	#superclass : #PP2DelegateNode,
	#instVars : [
		'tokenClass'
	],
	#category : 'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2CreateTokenNode >> accept: aPP2Visitor [
	self flag: 'JK: rename to visitCreateTokenNode: (???)'.
	^ aPP2Visitor visitToken: self
]

{ #category : #private }
PP2CreateTokenNode >> defaultTokenClass [
	^ PP2Token
]

{ #category : #initialization }
PP2CreateTokenNode >> initialize [
	super initialize.
	tokenClass := self defaultTokenClass
]

{ #category : #testing }
PP2CreateTokenNode >> isToken [
	^ true
]

{ #category : #comparing }
PP2CreateTokenNode >> localEquals: anotherNode [
	(super localEquals: anotherNode) ifFalse: [ ^ false ].

	^ self tokenClass == anotherNode tokenClass
]

{ #category : #comparing }
PP2CreateTokenNode >> localHash [
	^ super localHash bitXor: tokenClass hash
]

{ #category : #visiting }
PP2CreateTokenNode >> nodeName [
	^ self name
]

{ #category : #initialization }
PP2CreateTokenNode >> resetStrategy [
	strategy := PP2CreateToken on: self
]

{ #category : #accessing }
PP2CreateTokenNode >> tokenClass [
	^ tokenClass
]

{ #category : #accessing }
PP2CreateTokenNode >> tokenClass: anObject [
	tokenClass := anObject
]
