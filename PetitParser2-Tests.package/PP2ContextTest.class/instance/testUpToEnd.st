testing
testUpToEnd
	context := 'foobar' asPetit2Stream asPetit2Context.

	self assert: context position equals: 0.
		
	retval := context upToEnd.

	self assert: context position equals: 6.
	self assert: retval equals: 'foobar'.
	