Class {
	#name : #'PP2SmalltalkGrammarTests_InMemoryCtx',
	#superclass : #PP2CompositeNodeTest,
	#traits : 'TPP2SmalltalkGrammarTests',
	#classTraits : 'TPP2SmalltalkGrammarTests classTrait',
	#category : 'PetitParser2-Smalltalk-Tests-Core'
}

{ #category : #context }
PP2SmalltalkGrammarTests_InMemoryCtx >> context [
	^ PP2InMemoryContext new
]
