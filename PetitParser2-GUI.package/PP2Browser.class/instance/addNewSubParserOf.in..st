private building
addNewSubParserOf: class in: list
	| refactoring className |
	className := UIManager default request: 'Parser class name' initialAnswer: '' title: 'Add new parser'.
	^ className
		ifNotNil: [ 
			refactoring := PP2AddParserRefactoring name: className asSymbol category: #ParserExample superclass: class.
			PP2RefactoringUtils new performRefactoring: refactoring.
			list update ]