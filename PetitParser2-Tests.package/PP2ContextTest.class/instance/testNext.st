testing
testNext
	context := 'foo' asPetit2Stream asPetit2Context.
	
	retval := context next: 3.
	self assert: retval isPetit2Success.
	self assert: retval equals: 'foo'.
	
	retval := context next: 1.
	self assert: retval isNil.
	
	context position: 0.
	retval := context next: 3.
	self assert: retval isPetit2Success.
	self assert: retval = 'foo'.
