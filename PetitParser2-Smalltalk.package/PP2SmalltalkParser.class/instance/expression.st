grammar
expression
	^ super expression map: [ :variableNodes :expressionNodes | self build: expressionNodes assignment: variableNodes ]