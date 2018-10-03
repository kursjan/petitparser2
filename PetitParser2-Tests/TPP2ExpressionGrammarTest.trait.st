"
TestSuite for PP2ExpressionGrammar
"
Trait {
	#name : #TPP2ExpressionGrammarTest,
	#category : 'PetitParser2-Tests-Examples'
}

{ #category : #accessing }
TPP2ExpressionGrammarTest >> parserClass [
	^ PP2ExpressionGrammar 
]

{ #category : #testing }
TPP2ExpressionGrammarTest >> testAddition [
	self parse: '1 + 2' rule: #addition.
	self parse: '1 + (2 + 3)' rule: #addition.	
	self parse: '1 + (2 * 3)' rule: #addition.		
		
	self fail: '1 * 2' rule: #addition.
]

{ #category : #testing }
TPP2ExpressionGrammarTest >> testMultiplication [
	self parse: '1 * 2' rule: #multiplication.
	self parse: '1 * (2 + 3)' rule: #multiplication.	
	self parse: '1 * (2 * 3)' rule: #multiplication.		
		
	self fail: '1 + 2' rule: #multiplication.
]

{ #category : #testing }
TPP2ExpressionGrammarTest >> testNumber [
	self parse: '1' rule: #number.
	self parse: '10' rule: #number.
	self parse: '10.3' rule: #number.
	
	self fail: 'foo' rule: #number.
]

{ #category : #testing }
TPP2ExpressionGrammarTest >> testParentheses [
	self parse: '(1)' rule: #parentheses.
	self parse: '(1.2)' rule: #parentheses.
]

{ #category : #testing }
TPP2ExpressionGrammarTest >> testPrimary [
	self parse: '10.3' rule: #primary.
	self parse: '(10.3)' rule: #primary.

	self parse: '(1 * 2 + 3)' rule: #primary.

]

{ #category : #testing }
TPP2ExpressionGrammarTest >> testTerms [
	self parse: '1' rule: #terms.
	self parse: '1 + 1' rule: #terms.
	self parse: '1 * 1' rule: #terms.
	self parse: '((1) * (2 + (3 + 4)))' rule: #terms.
	
	self fail: '1 ^ 1' rule: #terms.

]
