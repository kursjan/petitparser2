testing
testAddition
	self parse: '1 + 2' rule: #addition.
	self parse: '1 + (2 + 3)' rule: #addition.	
	self parse: '1 + (2 * 3)' rule: #addition.		
		
	self fail: '1 * 2' rule: #addition.