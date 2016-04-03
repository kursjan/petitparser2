testing
testParentheses
	self parse: '(1)' rule: #parentheses.
	self parse: '(1.2)' rule: #parentheses.