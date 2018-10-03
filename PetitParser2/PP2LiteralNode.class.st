Class {
	#name : #PP2LiteralNode,
	#superclass : #PP2Node,
	#instVars : [
		'literal',
		'message'
	],
	#category : 'PetitParser2-Nodes'
}

{ #category : #'as yet unclassified' }
PP2LiteralNode class >> on: literal [
	^ self on: literal message: 'literal ', literal printString, ' expected'
]

{ #category : #'as yet unclassified' }
PP2LiteralNode class >> on: literal message: message [
	^ self new
		literal: literal;
		message: message;
		yourself
]

{ #category : #visiting }
PP2LiteralNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitLiteral: self
]

{ #category : #accessing }
PP2LiteralNode >> literal [
	^ literal
]

{ #category : #accessing }
PP2LiteralNode >> literal: anObject [
	literal := anObject
]

{ #category : #comparing }
PP2LiteralNode >> localEquals: anotherNode [
	(super localEquals: anotherNode) ifFalse: [ ^ false ].
	
	self literal = anotherNode literal ifFalse: [ ^ false ].
	self message = anotherNode message ifFalse: [ ^ false ].
	
	^ true
]

{ #category : #comparing }
PP2LiteralNode >> localHash [
	^ super localHash bitXor: (self literal hash bitXor: self message hash)
]

{ #category : #accessing }
PP2LiteralNode >> message [
	^ message
]

{ #category : #accessing }
PP2LiteralNode >> message: anObject [
	message := anObject
]

{ #category : #printing }
PP2LiteralNode >> printOn: aStream [
	aStream nextPut: $'.
	aStream nextPutAll: literal asString.
	aStream nextPut: $'.
	
	self flag: 'JK: delete?'
"	
	aStream nextPut: $(.
	aStream nextPutAll: literal printString.
	aStream nextPut: $).
"
]
