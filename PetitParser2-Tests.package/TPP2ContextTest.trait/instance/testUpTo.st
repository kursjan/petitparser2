tests
testUpTo
	| context retval |
	context := self contextOn: 'foobar'.

	self assert: context position equals: 0.
		
	retval := context upTo: $f.

	self assert: context position equals: 1.
	self assert: retval equals: 'f'.
	