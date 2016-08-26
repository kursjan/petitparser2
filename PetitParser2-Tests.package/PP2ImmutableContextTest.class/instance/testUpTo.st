testing
testUpTo
	context := 'foobar' asPetit2Stream asPetit2ImmutableContext.

	self assert: context position equals: 0.
		
	newContext := context upTo: $f.

	self deny: newContext == context.
	self assert: context position equals: 0.
	self assert: newContext position equals: 1.
	
	self assert: newContext retval = 'f'.
	