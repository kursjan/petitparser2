transforming
transform
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