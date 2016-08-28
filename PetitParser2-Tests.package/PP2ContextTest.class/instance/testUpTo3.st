testing
testUpTo3
	context := (MinimalStream on: 'foobar') asPetit2Stream asPetit2Context.

	self assert: context position equals: 0.
		
	retval := context upTo: $x.

	self assert: context position equals: 6.
	self assert: retval equals: 'foobar'.