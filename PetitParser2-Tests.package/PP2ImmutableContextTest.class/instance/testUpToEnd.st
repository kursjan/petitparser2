testing
testUpToEnd
	context := 'foobar' asPetit2Stream asPetit2ImmutableContext.

	self assert: context position equals: 0.
		
	newContext := context upToEnd.

	self deny: newContext == context.
	self assert: context position equals: 0.
	self assert: newContext position equals: 6.
	
	self assert: newContext retval = 'foobar'.
	