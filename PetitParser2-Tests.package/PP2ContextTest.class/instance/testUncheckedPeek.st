testing
testUncheckedPeek
	context := PP2Context new
 		position: 0;
		stream: 'foo' asPetit2Stream;
		yourself.
		
	self assert: context uncheckedPeek == $f.
	
	context position: 3.
	self should: [context uncheckedPeek] raise: Error.
	