testing
testUpTo3
	context := 'foobar' asPetit2Stream asPetit2Context.

	self assert: context position equals: 0.
		
	newContext := context upTo: $x.

	self deny: newContext == context.
	self assert: context position equals: 0.
	self assert: newContext position equals: 6.
	
	self assert: newContext value = 'foobar'.