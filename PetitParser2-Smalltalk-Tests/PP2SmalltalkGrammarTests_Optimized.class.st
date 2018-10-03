Class {
	#name : #'PP2SmalltalkGrammarTests_Optimized',
	#superclass : #PP2CompositeNodeTest,
	#traits : 'TPP2SmalltalkGrammarTests',
	#classTraits : 'TPP2SmalltalkGrammarTests classTrait',
	#category : 'PetitParser2-Smalltalk-Tests-Core'
}

{ #category : #context }
PP2SmalltalkGrammarTests_Optimized >> context [
	^ PP2InMemoryContext new
]

{ #category : #parsing }
PP2SmalltalkGrammarTests_Optimized >> parserInstance [
	^ super parserInstance optimize;
		resetCaches;
		yourself
]

{ #category : #parsing }
PP2SmalltalkGrammarTests_Optimized >> testOptimized [
	self assert: self parserInstance isOptimized
]
