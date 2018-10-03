Class {
	#name : #PP2ExpressionGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#traits : 'TPP2ExpressionGrammarTest',
	#classTraits : 'TPP2ExpressionGrammarTest classTrait',
	#category : 'PetitParser2-Tests-Examples'
}

{ #category : #testing }
PP2ExpressionGrammarTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
PP2ExpressionGrammarTest >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser parse: aStream withContext: aContext
]
