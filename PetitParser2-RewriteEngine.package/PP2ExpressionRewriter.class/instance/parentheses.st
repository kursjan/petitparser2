accessing
parentheses
	^ super parentheses parseNode
		nodeClass: PP2ExpressionParenthesesNode;
		nodeName: #parentheses;
		yourself