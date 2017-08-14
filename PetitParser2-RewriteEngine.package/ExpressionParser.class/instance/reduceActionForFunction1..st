generated-reduction actions
reduceActionForFunction1: nodes
	| result |
	result := ASTFunctionNode new.
	result nameToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightParen: (nodes at: 4).
	^ result