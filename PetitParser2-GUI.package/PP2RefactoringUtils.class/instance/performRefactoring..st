private refactoring
performRefactoring: aRefactoring
	[ [ aRefactoring execute ]
		on: RBRefactoringWarning
		do: [ :exception | self handleWarning: exception ] ]
		on: RBRefactoringError
		do: [ :exception | self handleError: exception ]