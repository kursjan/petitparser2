Trait {
	#name : #TPP2ExpressionParserTest,
	#category : 'PetitParser2-Tests-Examples'
}

{ #category : #tests }
TPP2ExpressionParserTest >> testNumber [
	self parse: '1' rule: #number to: 1.
]
