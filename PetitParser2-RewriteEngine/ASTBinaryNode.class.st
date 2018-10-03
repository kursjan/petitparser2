Class {
	#name : #ASTBinaryNode,
	#superclass : #ASTExpressionNode,
	#instVars : [
		'left',
		'operator',
		'right'
	],
	#category : 'PetitParser2-RewriteEngine-SmaCC'
}

{ #category : #generated }
ASTBinaryNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitBinary: self
]

{ #category : #generated }
ASTBinaryNode >> left [
	^ left
]

{ #category : #generated }
ASTBinaryNode >> left: anASTExpressionNode [
	self left notNil
		ifTrue: [ self left parent: nil ].
	left := anASTExpressionNode.
	self left notNil
		ifTrue: [ self left parent: self ]
]

{ #category : #generated }
ASTBinaryNode >> nodeVariables [
	^ #(#left #right)
]

{ #category : #generated }
ASTBinaryNode >> operator [
	^ operator
]

{ #category : #generated }
ASTBinaryNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
ASTBinaryNode >> right [
	^ right
]

{ #category : #generated }
ASTBinaryNode >> right: anASTExpressionNode [
	self right notNil
		ifTrue: [ self right parent: nil ].
	right := anASTExpressionNode.
	self right notNil
		ifTrue: [ self right parent: self ]
]

{ #category : #generated }
ASTBinaryNode >> tokenVariables [
	^ #(#operator)
]
