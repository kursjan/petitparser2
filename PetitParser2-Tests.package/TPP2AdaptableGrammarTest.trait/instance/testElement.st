tests
testElement
	self parse: '1a' rule: #element.
	self parse: '2aa' rule: #element.
	self fail: '2a' rule: #element.