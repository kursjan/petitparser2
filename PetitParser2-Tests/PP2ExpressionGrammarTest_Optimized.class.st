Class {
	#name : #'PP2ExpressionGrammarTest_Optimized',
	#superclass : #PP2CompositeNodeTest,
	#traits : 'TPP2ExpressionGrammarTest',
	#classTraits : 'TPP2ExpressionGrammarTest classTrait',
	#category : 'PetitParser2-Tests-Examples'
}

{ #category : #context }
PP2ExpressionGrammarTest_Optimized >> context [
	^ PP2InMemoryContext new
]

{ #category : #accessing }
PP2ExpressionGrammarTest_Optimized >> parserInstance [
	^ super parserInstance optimize
]
