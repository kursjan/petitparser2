tests
testUpTo4
	| context retval |
	context := self contextOn: 'foof'.

	context next.
	self assert: context position equals: 1.
		
	retval := context upTo: $f.

	self assert: context position equals: 4.
	self assert: retval equals: 'oof'.
	