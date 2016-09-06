testing
testTerms
	self parse: '1' rule: #terms.
	self parse: '1 + 1' rule: #terms.
	self parse: '1 * 1' rule: #terms.
	self parse: '((1) * (2 + (3 + 4)))' rule: #terms.
	
	self fail: '1 ^ 1' rule: #terms.
