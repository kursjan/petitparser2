Class {
	#name : #ASTExpressionNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : 'PetitParser2-RewriteEngine-SmaCC'
}

{ #category : #generated }
ASTExpressionNodeVisitor >> visitBinary: aBinary [
	^ self visitExpression: aBinary
]

{ #category : #generated }
ASTExpressionNodeVisitor >> visitExpression: anExpression [
	^ self visitSmaCCParseNode: anExpression
]

{ #category : #generated }
ASTExpressionNodeVisitor >> visitFunction: aFunction [
	^ self visitExpression: aFunction
]

{ #category : #generated }
ASTExpressionNodeVisitor >> visitNumber: aNumber [
	^ self visitExpression: aNumber
]
