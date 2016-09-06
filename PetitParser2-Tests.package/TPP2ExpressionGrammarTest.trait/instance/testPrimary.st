testing
testPrimary
	self parse: '10.3' rule: #primary.
	self parse: '(10.3)' rule: #primary.

	self parse: '(1 * 2 + 3)' rule: #primary.
