Class {
	#name : #PP2ExpressionParser,
	#superclass : #PP2ExpressionGrammar,
	#category : 'PetitParser2-Examples'
}

{ #category : #tokens }
PP2ExpressionParser >> number [
	^ super number ==> #asNumber
]
