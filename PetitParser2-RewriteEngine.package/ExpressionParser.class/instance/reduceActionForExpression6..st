generated-reduction actions
reduceActionForExpression6: nodes
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result leftParenTokens.
	result addToken: (nodes at: 3) to: result rightParenTokens.
	^ result