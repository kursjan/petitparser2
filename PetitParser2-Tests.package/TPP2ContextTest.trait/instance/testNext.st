tests
testNext
	| retval context |
	context := self contextOn: 'foo'.
	
	retval := context next: 3.
	self assert: retval isPetit2Success.
	self assert: retval equals: 'foo'.
	
	retval := context next: 1.
	self assert: retval isNil.
	
	context position: 0.
	retval := context next: 3.
	self assert: retval isPetit2Success.
	self assert: retval = 'foo'.
