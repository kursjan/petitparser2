tests-basic
testClose
	self parse: ')' rule: #close.
	self parse: ' )' rule: #close.
	self parse: ') ' rule: #close.
	self parse: ' 	) 
		' rule: #close