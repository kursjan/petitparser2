testing
testAtEnd
	context := 'foo' asPetit2Stream asPetit2Context.
	
	self deny: context atEnd.
	context next: 3.
	self assert: context atEnd.
