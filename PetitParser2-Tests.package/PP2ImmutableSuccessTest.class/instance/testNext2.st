tests
testNext2
	context := PP2ImmutableSuccess new
		position: 1;
		stream: 'bar' asPetit2Stream;
		retval: #foo;
		yourself.
	
	self assert: context isPetit2Success.
	self assert: context value == #foo.
	newContext := context next: 1.
	
	self assert: context ~~ newContext.

	self assert: context uncheckedPeek == $a.
	self assert: context value == #foo.
	self assert: context position = 1.
	
	self assert: newContext uncheckedPeek == $r.	
	self assert: newContext value = 'a'.
	self assert: newContext position = 2.