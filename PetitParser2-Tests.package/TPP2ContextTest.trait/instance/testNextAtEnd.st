tests
testNextAtEnd
	| context retval |
	context := self contextOn: 'foo'.
	
	context position: 3.
	
	retval := context next.
	self assert: retval isNil.	
	self assert: context position equals: 3.