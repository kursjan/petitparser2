Class {
	#name : #PP2ExpressionParenthesesNode,
	#superclass : #PP2ParseNode,
	#category : 'PetitParser2-RewriteEngine-Examples'
}

{ #category : #generated }
PP2ExpressionParenthesesNode >> leftParen [
	^ self first
]

{ #category : #generated }
PP2ExpressionParenthesesNode >> rightParen [
	^ self third
]
