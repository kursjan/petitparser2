Class {
	#name : #PP2RemoveProdcutionRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'production',
		'class'
	],
	#category : 'PetitParser2-GUI-Refactoring'
}

{ #category : #'instance creation' }
PP2RemoveProdcutionRefactoring class >> onClass: aClass production: aSelector [
	^ self new
		setClass: aClass;
		setProduction: aSelector;
		yourself
]

{ #category : #preconditions }
PP2RemoveProdcutionRefactoring >> preconditions [
	^ (self checkCompositeParser2: class)
		& (RBCondition definesSelector: production asSymbol in: class)
		& (RBCondition definesInstanceVariable: production asString in: class)
]

{ #category : #initialization }
PP2RemoveProdcutionRefactoring >> setClass: aClass [
	class := self classObjectFor: aClass
]

{ #category : #initialization }
PP2RemoveProdcutionRefactoring >> setProduction: aSymbol [
	production := aSymbol
]

{ #category : #transforming }
PP2RemoveProdcutionRefactoring >> transform [
	class removeMethod: production asSymbol.
	class removeInstanceVariable: production asString
]
