testing
testNext2
	context := 'foo' asPetit2Stream asPetit2Context.
	
	context position: 3.
	
	retval := context next.
	self assert: retval isNil.	
	self assert: context position equals: 3.