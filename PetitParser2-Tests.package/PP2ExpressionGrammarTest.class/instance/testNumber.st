testing
testNumber
	self parse: '1' rule: #number.
	self parse: '10' rule: #number.
	self parse: '10.3' rule: #number.
	
	self fail: 'foo' rule: #number.