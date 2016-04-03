testing
testNext
	context := 'foo' asPetit2Stream asPetit2Context.
	
	newContext := context next: 3.
	self assert: newContext isPetit2Success.
	self assert: newContext retval = 'foo'.
	
	newContext := newContext next: 1.
	self assert: newContext retval isNil.
	
	newContext := context next: 3.
	self assert: newContext isPetit2Success.
	self assert: newContext retval = 'foo'.
