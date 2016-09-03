tests
testUncheckedNext
	| context retval |
	context := self contextOn: 'foo'.
	
	self assert: context position equals: 0.
	
	retval := context uncheckedNext.
	self assert: retval isPetit2Success.
	self assert: retval equals: $f.
	self assert: context position equals: 1.