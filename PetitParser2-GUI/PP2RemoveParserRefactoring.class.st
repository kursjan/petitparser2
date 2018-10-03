Class {
	#name : #PP2RemoveParserRefactoring,
	#superclass : #RBRemoveClassRefactoring,
	#instVars : [
		'class'
	],
	#category : 'PetitParser2-GUI-Refactoring'
}

{ #category : #'instance creation' }
PP2RemoveParserRefactoring class >> onClass: aClass [
	^ self new
		setClass: aClass;
		yourself
]

{ #category : #preconditions }
PP2RemoveParserRefactoring >> preconditions [
	^ (self checkCompositeParser2: class) & (RBCondition hasSubclasses: class) not
]

{ #category : #initialization }
PP2RemoveParserRefactoring >> setClass: aClass [
	class := self classObjectFor: aClass
]

{ #category : #transforming }
PP2RemoveParserRefactoring >> transform [
	model removeClass: class
]
