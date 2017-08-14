generated-reduction actions
reduceActionForExpression2: nodes
	| result |
	result := ASTBinaryNode new.
	result left: (nodes at: 1).
	result operator: (nodes at: 2).
	result right: (nodes at: 3).
	^ result