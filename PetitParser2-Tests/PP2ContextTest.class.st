Class {
	#name : #PP2ContextTest,
	#superclass : #TestCase,
	#traits : 'TPP2ContextTest + TPP2DebuggableTest',
	#classTraits : 'TPP2ContextTest classTrait + TPP2DebuggableTest classTrait',
	#category : 'PetitParser2-Tests-Core'
}

{ #category : #requirements }
PP2ContextTest >> contextOn: aString [
	^ PP2Context on: aString asPetit2Stream
]

{ #category : #tests }
PP2ContextTest >> testAsPetit2Context [
	| context |
	context := (PP2MinimalStream on: 'foo') asPetit2Stream asPetit2Context.
	
	self assert: (context isKindOf: PP2Context).
	self assert: context isPetit2Success.
]

{ #category : #tests }
PP2ContextTest >> testAsPositionableStream [
	| context |
	context := (PP2MinimalStream on: 'foo') asPetit2Stream asPetit2Context.
	context position: 2.

	self should: [ context asPositionableStream ] raise: Exception
]

{ #category : #tests }
PP2ContextTest >> testCopy [
	| newContext context |
	context := PP2Context new
 		position: #postion;
		stream: #stream;
		parser: #parser;
		startMemento: #startMemento;
		yourself.
		
	newContext := context copy.
	
	self deny: context == newContext.
	self assert: context position = newContext position.
	self assert: context stream = newContext stream.	
	self assert: context parser = newContext parser.
	self assert: context startMemento = newContext startMemento.

]
