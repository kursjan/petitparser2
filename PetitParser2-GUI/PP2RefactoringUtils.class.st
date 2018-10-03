Class {
	#name : #PP2RefactoringUtils,
	#superclass : #Object,
	#category : 'PetitParser2-GUI-Refactoring'
}

{ #category : #'private refactoring' }
PP2RefactoringUtils >> handleError: anException [
	anException actionBlock isNil
		ifTrue: [ UIManager default inform: anException messageText ]
		ifFalse: [ 
			(UIManager default confirm: anException messageText) 
				ifTrue: [ anException actionBlock value ] ].
	anException return
]

{ #category : #'private refactoring' }
PP2RefactoringUtils >> handleWarning: anException [ 
	| message |
	message := (anException messageText endsWith: '?')
		ifTrue: [ anException messageText ]
		ifFalse: [ anException messageText , String cr , 'Do you want to proceed?' ].
	(UIManager default confirm: message)
		ifTrue: [ anException resume ]
		ifFalse: [ anException return ]
]

{ #category : #'private refactoring' }
PP2RefactoringUtils >> performRefactoring: aRefactoring [
	[ [ aRefactoring execute ]
		on: RBRefactoringWarning
		do: [ :exception | self handleWarning: exception ] ]
		on: RBRefactoringError
		do: [ :exception | self handleError: exception ]
]

{ #category : #'private refactoring' }
PP2RefactoringUtils >> performRenameProduction: oldName from: class [
	| refactoring newName |
	newName := UIManager default request: 'Production name:' initialAnswer: oldName.
	refactoring := PP2RenameProdcutionRefactoring onClass: class rename: oldName to: newName.
	self performRefactoring: refactoring.
	^ refactoring
]
