Class {
	#name : #PP2CsNodeTest,
	#superclass : #PP2AbstractParserTest,
	#instVars : [
		'node',
		'context'
	],
	#category : 'PetitParser2-Tests-Nodes'
}

{ #category : #accessing }
PP2CsNodeTest >> context [
	context isNil ifTrue: [ 
		context := super context
	].

	^ context
]

{ #category : #accessing }
PP2CsNodeTest >> parse: aStream withParser: aParser withContext: aContext [
	^ context := aParser parse: aStream withContext: aContext
]

{ #category : #tests }
PP2CsNodeTest >> testStackId [
	self assert: $a asPParser push stackId equals: #defaultStack.
	self assert: $a asPParser pop stackId equals: #defaultStack.	
	self assert: $a asPParser match stackId equals: #defaultStack.
]
