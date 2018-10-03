Class {
	#name : #ASTExpressionNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'leftParenTokens',
		'rightParenTokens'
	],
	#category : 'PetitParser2-RewriteEngine-SmaCC'
}

{ #category : #generated }
ASTExpressionNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitExpression: self
]

{ #category : #generated }
ASTExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#leftParenTokens #rightParenTokens)
]

{ #category : #'generated-initialize-release' }
ASTExpressionNode >> initialize [
	super initialize.
	leftParenTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
]

{ #category : #generated }
ASTExpressionNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
ASTExpressionNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
ASTExpressionNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
ASTExpressionNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]
