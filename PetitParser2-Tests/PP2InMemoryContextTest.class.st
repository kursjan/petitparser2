Class {
	#name : #PP2InMemoryContextTest,
	#superclass : #TestCase,
	#traits : 'TPP2ContextTest + TPP2DebuggableTest + TPP2TypeAssertions',
	#classTraits : 'TPP2ContextTest classTrait + TPP2DebuggableTest classTrait + TPP2TypeAssertions classTrait',
	#category : 'PetitParser2-Tests-Core'
}

{ #category : #requirements }
PP2InMemoryContextTest >> contextOn: aString [
	^ PP2InMemoryContext on: aString
]

{ #category : #'tests - converting' }
PP2InMemoryContextTest >> testAsPetit2Context [
	| context |
	context := 'foo' asPetit2Stream asPetit2Context.
	
	self assert: (context isKindOf: PP2InMemoryContext).
	self assert: context isPetit2Success.
]

{ #category : #'tests - converting' }
PP2InMemoryContextTest >> testAsPetit2ContextDirect [
	| context |
	context := 'foo' asPetit2Context.
	self assert: context isKindOf: PP2InMemoryContext.
	self assert: context start equals: 0.
	self assert: context readLimit equals: 3
]

{ #category : #'tests - converting' }
PP2InMemoryContextTest >> testAsPositionableStream [
	| stream context |
	
	context := 'bar' asPetit2Stream asPetit2Context.
	context position: 2.

	stream := context asPositionableStream.
	
	self assert: (stream isKindOf: PositionableStream).
	self assert: stream position equals: 2.
	self assert: stream peek equals: $r.
]

{ #category : #tests }
PP2InMemoryContextTest >> testCopy [
	| stream newContext context |
	stream := 'foo' asPetit2Stream.
	
	context := PP2InMemoryContext new
		stream: stream;
 		position: 1;
		parser: #parser;
		startMemento: #startMemento;
		yourself.
		
	newContext := context copy.
	
	self deny: context == newContext.
	self assert: context position = newContext position.
	self assert: context contents = newContext contents.	
	self assert: context parser = newContext parser.
	self assert: context startMemento = newContext startMemento.
]
