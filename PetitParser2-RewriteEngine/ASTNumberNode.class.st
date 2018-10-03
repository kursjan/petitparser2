Class {
	#name : #ASTNumberNode,
	#superclass : #ASTExpressionNode,
	#instVars : [
		'numberToken'
	],
	#category : 'PetitParser2-RewriteEngine-SmaCC'
}

{ #category : #generated }
ASTNumberNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitNumber: self
]

{ #category : #generated }
ASTNumberNode >> numberToken [
	^ numberToken
]

{ #category : #generated }
ASTNumberNode >> numberToken: aSmaCCToken [
	numberToken := aSmaCCToken
]

{ #category : #generated }
ASTNumberNode >> tokenVariables [
	^ #(#numberToken)
]
