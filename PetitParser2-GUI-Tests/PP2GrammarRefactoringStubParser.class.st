Class {
	#name : #PP2GrammarRefactoringStubParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'refactoring',
		'primary',
		'addition',
		'terms'
	],
	#category : 'PetitParser2-GUI-Tests-Refactoring'
}

{ #category : #grammar }
PP2GrammarRefactoringStubParser >> addition [
	^ primary, $+ asPParser trim, terms
]
