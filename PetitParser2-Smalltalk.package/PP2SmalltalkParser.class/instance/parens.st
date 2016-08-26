grammar
parens
	^ super parens map: [ :openToken :expressionNode :closeToken | expressionNode addParenthesis: (openToken start to: closeToken start) ]