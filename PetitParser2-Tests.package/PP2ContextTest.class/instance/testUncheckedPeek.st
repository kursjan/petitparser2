testing
testUncheckedPeek
	context := (PP2MinimalStream on: 'foo') asPetit2Stream asPetit2Context.
		
	self assert: context uncheckedPeek == $f.
	
	context position: 3.
	self should: [context uncheckedPeek] raise: Error.
	