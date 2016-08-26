testing
testSuccess
	context := PP2ImmutableSuccess new
		position: 1;
		stream: 'bar' asPetit2Stream;
		retval: #foo;
		yourself.
	
	self assert: context isPetit2Success.
	self assert: context value == #foo.
	self assert: context retval == #foo.
	self assert: context atEnd not.
	self assert: context uncheckedPeek == $a.