testing
testUpTo
	context := 'foobar' asPetit2Stream asPetit2Context.

	self assert: context position equals: 0.
		
	retval := context upTo: $f.

	self assert: context position equals: 1.
	self assert: retval equals: 'f'.
	