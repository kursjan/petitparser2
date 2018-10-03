Class {
	#name : #PP2ExtractProductionRefactoring,
	#superclass : #RBExtractMethodRefactoring,
	#instVars : [
		'targetProduction'
	],
	#category : 'PetitParser2-GUI-Refactoring'
}

{ #category : #'instance creation' }
PP2ExtractProductionRefactoring class >> onClass: aClass production: aSelector interval: anInterval to: aTargetSelector [
	^ (self extract: anInterval from: aSelector in: aClass)
		setTargetProduction: aTargetSelector;
		yourself
]

{ #category : #transforming }
PP2ExtractProductionRefactoring >> existingSelector [
	^ nil
]

{ #category : #transforming }
PP2ExtractProductionRefactoring >> getNewMethodName [
	parameters isEmpty
		ifFalse: [ self refactoringError: 'Cannot extract production since it contains references.' ].
	targetProduction asSymbol isUnary
		ifFalse: [ self refactoringError: 'Invalid production name.' ].
	^ targetProduction asSymbol
]

{ #category : #transforming }
PP2ExtractProductionRefactoring >> nameNewMethod: aSymbol [ 
	class addInstanceVariable: aSymbol asString.
	extractedParseTree renameSelector: aSymbol andArguments: #().
	modifiedParseTree := RBParseTreeRewriter 
		replace: self methodDelimiter
		with: aSymbol asString
		in: modifiedParseTree
]

{ #category : #preconditions }
PP2ExtractProductionRefactoring >> preconditions [
	^ (self checkCompositeParser2: class)
		& super preconditions		
		& (RBCondition definesSelector: targetProduction asSymbol in: class) not
		& (RBCondition definesInstanceVariable: targetProduction asString in: class) not
]

{ #category : #initialization }
PP2ExtractProductionRefactoring >> setTargetProduction: aSymbol [
	targetProduction := aSymbol
]

{ #category : #requests }
PP2ExtractProductionRefactoring >> shouldExtractAssignmentTo: aString [
	^ false
]
