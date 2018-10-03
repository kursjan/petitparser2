Class {
	#name : #PP2GrammarRefactoringTest,
	#superclass : #TestCase,
	#instVars : [
		'refactoring'
	],
	#category : 'PetitParser2-GUI-Tests-Refactoring'
}

{ #category : #accessing }
PP2GrammarRefactoringTest >> change [
	^ self refactoring changes
]

{ #category : #accessing }
PP2GrammarRefactoringTest >> changes [
	^ self change changes
]

{ #category : #utilities }
PP2GrammarRefactoringTest >> performRefactoring: aRefactoring [
	refactoring := aRefactoring.
	aRefactoring primitiveExecute
]

{ #category : #accessing }
PP2GrammarRefactoringTest >> refactoring [
	^ refactoring
]

{ #category : #'testing-parsers' }
PP2GrammarRefactoringTest >> testAddParser [
	self performRefactoring: (PP2AddParserRefactoring name: #PPMockParser category: #'PetitGui-Mock').
	self assert: self changes size equals: 2.
	self assert: self changes first class equals: RBAddClassChange.
	self assert: self changes first definitionClass equals: PP2CompositeNode.
	self assert: self changes first changeClassName equals: #PPMockParser.
	self assert: self changes first category equals: #'PetitGui-Mock'.
	self assert: self changes last class equals: RBAddMethodChange.
	self assert: self changes last parseTree equals: (RBParser parseMethod: 'start ^ self shouldBeImplemented')
]

{ #category : #'testing-parsers' }
PP2GrammarRefactoringTest >> testAddParserWithSuperclass [
	self
		performRefactoring:
			(PP2AddParserRefactoring name: #PPMockParser category: #'PetitGui-Mock' superclass: PP2ExpressionGrammar).
	self assert: self changes size equals: 2.
	self assert: self changes first class equals: RBAddClassChange.
	self assert: self changes first definitionClass equals: PP2ExpressionGrammar.
	self assert: self changes first changeClassName equals: #PPMockParser.
	self assert: self changes first category equals: #'PetitGui-Mock'.
	self assert: self changes last class equals: RBAddMethodChange.
	self assert: self changes last parseTree equals: (RBParser parseMethod: 'start ^ self shouldBeImplemented')
]

{ #category : #'testing-productions' }
PP2GrammarRefactoringTest >> testDefineProduction [
	self
		performRefactoring:
			(PP2DefineProdcutionRefactoring
				onClass: PP2GrammarRefactoringStubParser
				source: 'function ^ #any asPParser plus , $( asPParser , $) asPParser ==> [ :e | 0 ]'
				protocols: (Array with: #productions)).
	self assert: self changes size equals: 2.
	self assert: self changes first class equals: RBAddInstanceVariableChange.
	self assert: self changes first variable equals: 'function'.
	self assert: self changes last class equals: RBAddMethodChange.
	self
		assert: self changes last parseTree
		equals: (RBParser parseMethod: 'function ^ #any asPParser plus , $( asPParser , $) asPParser ==> [ :e | 0 ]')
]

{ #category : #'testing-productions' }
PP2GrammarRefactoringTest >> testExtractProduction [
	self
		performRefactoring:
			(PP2ExtractProductionRefactoring
				onClass: PP2GrammarRefactoringStubParser
				production: #addition
				interval: (22 to: 33)
				to: #plus).
	self assert: self changes size equals: 3.
	self assert: self changes first class equals: RBAddInstanceVariableChange.
	self assert: self changes first variable equals: 'plus'.
	self assert: self changes second class equals: RBAddMethodChange.
	self assert: self changes second parseTree equals: (RBParser parseMethod: 'plus ^ $+ asPParser').
	self assert: self changes last class equals: RBAddMethodChange.
	self
		assert: self changes last parseTree
		equals:
			(RBParser
				parseMethod:
					'addition	^ primary, plus trim, terms')
]

{ #category : #'testing-parsers' }
PP2GrammarRefactoringTest >> testRemoveParser [
	self performRefactoring: (PP2RemoveParserRefactoring onClass: PP2GrammarRefactoringStubParser).
	self assert: self changes size equals: 1.
	self assert: self changes first class equals: RBRemoveClassChange.
	self assert: self changes first changeClassName equals: 'PP2GrammarRefactoringStubParser'
]

{ #category : #'testing-productions' }
PP2GrammarRefactoringTest >> testRemoveProduction [
	self performRefactoring: (PP2RemoveProdcutionRefactoring onClass: PP2GrammarRefactoringStubParser production: #addition).
	self assert: self changes size equals: 2.
	self assert: self changes first class equals: RBRemoveMethodChange.
	self assert: self changes first selector equals: #addition.
	self assert: self changes last class equals: RBRemoveInstanceVariableChange.
	self assert: self changes last variable equals: 'addition'
]

{ #category : #'testing-productions' }
PP2GrammarRefactoringTest >> testRenameProduction [
	self performRefactoring: (PP2RenameProdcutionRefactoring onClass: PP2GrammarRefactoringStubParser rename: #addition to: #add).
	self assert: self changes size equals: 3.
	self assert: self changes first class equals: RBRenameInstanceVariableChange.
	self assert: self changes first oldName equals: 'addition'.
	self assert: self changes first newName equals: 'add'.
	self assert: self changes second class equals: RBAddMethodChange.
	self
		assert: self changes second parseTree
		equals:
			(RBParser
				parseMethod:
					'add ^ primary, $+ asPParser trim, terms').
	self assert: self changes last class equals: RBRemoveMethodChange.
	self assert: self changes last selector equals: #addition
]
