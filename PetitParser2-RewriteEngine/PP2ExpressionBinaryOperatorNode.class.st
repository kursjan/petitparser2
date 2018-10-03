Class {
	#name : #PP2ExpressionBinaryOperatorNode,
	#superclass : #PP2ParseNode,
	#category : 'PetitParser2-RewriteEngine-Examples'
}

{ #category : #accessing }
PP2ExpressionBinaryOperatorNode >> left [
	^ self first
]

{ #category : #accessing }
PP2ExpressionBinaryOperatorNode >> nodeVariables [
	^ #(#left operator right)
]

{ #category : #accessing }
PP2ExpressionBinaryOperatorNode >> operator [
	^ self second
]

{ #category : #accessing }
PP2ExpressionBinaryOperatorNode >> right [
	^ self third
]
