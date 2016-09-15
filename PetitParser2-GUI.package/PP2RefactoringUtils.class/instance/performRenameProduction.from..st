private refactoring
performRenameProduction: oldName from: class
	| refactoring newName |
	newName := UIManager default request: 'Production name:' initialAnswer: oldName.
	refactoring := PP2RenameProdcutionRefactoring onClass: class rename: oldName to: newName.
	self performRefactoring: refactoring.
	^ refactoring