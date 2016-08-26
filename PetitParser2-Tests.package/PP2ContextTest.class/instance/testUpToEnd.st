testing
testUpToEnd
	context := 'foobar' asPetit2Stream asPetit2Context.

	self assert: context position equals: 0.
		
	newContext := context upToEnd.

	self deny: newContext == context.
	self assert: context position equals: 0.
	self assert: newContext position equals: 6.
	
	self assert: newContext value = 'foobar'.
	