generated-reduction actions
reduceActionForNumber1: nodes
	| result |
	result := ASTNumberNode new.
	result numberToken: (nodes at: 1).
	^ result