Class {
	#name : #'PP2SmalltalkParserTests_Optimized',
	#superclass : #'PP2SmalltalkGrammarTests_Optimized',
	#traits : 'TPP2SmalltalkParserTests',
	#classTraits : 'TPP2SmalltalkParserTests classTrait',
	#category : 'PetitParser2-Smalltalk-Tests-Core'
}

{ #category : #context }
PP2SmalltalkParserTests_Optimized >> context [
	^ PP2InMemoryContext new
]

{ #category : #accessing }
PP2SmalltalkParserTests_Optimized >> result [
	^ result
]

{ #category : #parsing }
PP2SmalltalkParserTests_Optimized >> testOptimized [
	self assert: self parserInstance isOptimized
]
