testing
testAtEnd
	context := 'foo' asPetit2Stream asPetit2Context.
	
	self deny: context atEnd.
	newContext := context next: 3.
	self deny: context atEnd.
	self assert: newContext atEnd.