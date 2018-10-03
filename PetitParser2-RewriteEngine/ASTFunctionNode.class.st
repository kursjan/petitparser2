Class {
	#name : #ASTFunctionNode,
	#superclass : #ASTExpressionNode,
	#instVars : [
		'nameToken',
		'leftParen',
		'arguments',
		'commaTokens',
		'rightParen'
	],
	#category : 'PetitParser2-RewriteEngine-SmaCC'
}

{ #category : #generated }
ASTFunctionNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitFunction: self
]

{ #category : #generated }
ASTFunctionNode >> arguments [
	^ arguments
]

{ #category : #generated }
ASTFunctionNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
ASTFunctionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
ASTFunctionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
ASTFunctionNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
ASTFunctionNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
ASTFunctionNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
ASTFunctionNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
ASTFunctionNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
ASTFunctionNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
ASTFunctionNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
ASTFunctionNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
ASTFunctionNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
ASTFunctionNode >> tokenVariables [
	^ #(#nameToken #leftParen #rightParen)
]
