tests
testContent
	self parse: '1_2__3___' rule: #content.
	self fail: '1_2' rule: #content.