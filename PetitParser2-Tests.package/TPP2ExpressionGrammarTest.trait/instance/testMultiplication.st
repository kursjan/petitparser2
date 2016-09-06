testing
testMultiplication
	self parse: '1 * 2' rule: #multiplication.
	self parse: '1 * (2 + 3)' rule: #multiplication.	
	self parse: '1 * (2 * 3)' rule: #multiplication.		
		
	self fail: '1 + 2' rule: #multiplication.