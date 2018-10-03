Class {
	#name : #PP2NextSetsContext,
	#superclass : #PP2NoopContext,
	#instVars : [
		'currentNext'
	],
	#category : 'PetitParser2-Analysis'
}

{ #category : #comparing }
PP2NextSetsContext >> = anotherContext [
	super = anotherContext ifFalse: [ ^ false ].
	
	(self currentNext size = anotherContext currentNext size) ifFalse: [ ^ false ].
	self currentNext do: [ :value |
		(anotherContext currentNext includes: value) ifFalse: [ ^ false ]
	].

	^ true
]

{ #category : #accessing }
PP2NextSetsContext >> currentNext [
	^ currentNext
]

{ #category : #accessing }
PP2NextSetsContext >> currentNext: anObject [
	self assert: [ anObject class == IdentitySet ] description: 'if not, override the #hash and #='.
	currentNext := anObject
]

{ #category : #comparing }
PP2NextSetsContext >> hash [
	| hash |
	hash := super hash.

	currentNext size <= 10 ifTrue: [  
		currentNext do: [ :e | e identityHash ].
	].

	^ hash bitXor: currentNext size hash
]
