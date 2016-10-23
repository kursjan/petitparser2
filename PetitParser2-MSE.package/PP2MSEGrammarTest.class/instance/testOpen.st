tests-basic
testOpen
	self parse: '(' rule: #open.
	self parse: ' (' rule: #open.
	self parse: '( ' rule: #open.
	self parse: ' 	( 
		' rule: #open