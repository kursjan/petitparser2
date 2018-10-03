Class {
	#name : #PP2RenameProdcutionRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'oldProduction',
		'newProduction',
		'class'
	],
	#category : 'PetitParser2-GUI-Refactoring'
}

{ #category : #'instance creation' }
PP2RenameProdcutionRefactoring class >> onClass: aClass rename: anOldSelector to: aNewSelector [
	^ self new
		setClass: aClass;
		setOldProduction: anOldSelector;
		setNewProduction: aNewSelector;
		yourself
]

{ #category : #preconditions }
PP2RenameProdcutionRefactoring >> preconditions [
	^ self checkCompositeParser2: class
]

{ #category : #initialization }
PP2RenameProdcutionRefactoring >> setClass: aClass [
	class := self classObjectFor: aClass
]

{ #category : #initialization }
PP2RenameProdcutionRefactoring >> setNewProduction: aSymbol [
	newProduction := aSymbol
]

{ #category : #initialization }
PP2RenameProdcutionRefactoring >> setOldProduction: aSymbol [
	oldProduction := aSymbol
]

{ #category : #transforming }
PP2RenameProdcutionRefactoring >> transform [
	| baseClass oldEnvironment |
	baseClass := class whoDefinesInstanceVariable: oldProduction asString.
	self performComponentRefactoring: (RBRenameInstanceVariableRefactoring
		model: model
		rename: oldProduction asString
		to: newProduction asString
		in: baseClass
		renameAccessors: false).
	oldEnvironment := model environment.
	model environment: (model environment
		forClasses: baseClass realClass withAllSubclasses).
	[ self performComponentRefactoring: (RBRenameMethodRefactoring
		model: model
		renameMethod: oldProduction asSymbol
		in: baseClass
		to: newProduction asSymbol 
		permutation: #()) ]
			ensure: [ model environment: oldEnvironment ]
]
