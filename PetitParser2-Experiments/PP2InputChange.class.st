Class {
	#name : #PP2InputChange,
	#superclass : #Object,
	#instVars : [
		'position',
		'input'
	],
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #'instance creation' }
PP2InputChange class >> on: input at: position [
	^ self new
		position: position;
		input: input;
		yourself
]

{ #category : #enumerating }
PP2InputChange >> deepSelectTokens: node into: aSet [
	node isToken ifTrue: [ aSet add: node ].
	
	node nodesDo: [ :child | self deepSelectTokens: child into: aSet	]
	
]

{ #category : #accessing }
PP2InputChange >> input [
	^ input
]

{ #category : #accessing }
PP2InputChange >> input: anObject [
	input := anObject
]

{ #category : #accessing }
PP2InputChange >> position [
	^ position
]

{ #category : #accessing }
PP2InputChange >> position: anObject [
	position := anObject
]

{ #category : #'private - updates' }
PP2InputChange >> updateBuffer: buffer [
	self subclassResponsibility
]

{ #category : #updates }
PP2InputChange >> updateContext: context [
	context adoptString: input
]

{ #category : #updates }
PP2InputChange >> updateParser: node [
	node ifNil: [ ^ self ].
	node allReparsables do: [ :reparsable |
		reparsable buffer: (self updateBuffer: reparsable buffer).
	]
]

{ #category : #'private - updates' }
PP2InputChange >> updateToken: token [
	self subclassResponsibility
]

{ #category : #updates }
PP2InputChange >> updateTokens: node [
	| set |
	"make sure you update every token only once ;-)"
	set := IdentitySet new.
	self deepSelectTokens: node into: set.
	
	set do: [ :token | self updateToken: token ].
	
]
