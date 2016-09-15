private building
addNewSubParserOf: class in: list
	| refactoring className |
	className := UIManager default request: 'Parser class name' initialAnswer: '' title: 'Add new parser'.
	^ className
		ifNotNil: [ 
			refactoring := PPAddParserRefactoring name: className asSymbol category: #ParserExample superclass: class.
			PPRefactoringUtils new performRefactoring: refactoring.
			list update ]