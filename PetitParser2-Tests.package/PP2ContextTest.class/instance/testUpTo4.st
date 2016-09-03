testing
testUpTo4
	context := (PP2MinimalStream on: 'foof') asPetit2Stream asPetit2Context.

	context next.
	self assert: context position equals: 1.
		
	retval := context upTo: $f.

	self assert: context position equals: 4.
	self assert: retval equals: 'oof'.
	