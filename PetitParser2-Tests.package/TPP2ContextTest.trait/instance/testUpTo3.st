tests
testUpTo3
	| context retval |
	context := self contextOn: 'foobar'.

	self assert: context position equals: 0.
		
	retval := context upTo: $x.

	self assert: context position equals: 6.
	self assert: retval equals: 'foobar'.