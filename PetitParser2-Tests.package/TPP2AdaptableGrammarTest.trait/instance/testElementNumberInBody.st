tests
testElementNumberInBody
	self parse: '10___4______' rule: #content.
	self fail: '1_2' rule: #content.