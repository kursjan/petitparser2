testing
testCopyFromTo
	context := PP2Success new
 		position: #postion;
		stream: 'foobar' asPetit2Stream;
		parser: #parser;
		continuationStack: #continuationStack;
		yourself.
		
	newContext := context copyFrom: 0 to: 2.
	
	self deny: context == newContext.
	self assert: context position = newContext position.
	self assert: context stream = newContext stream.	
	self assert: context parser = newContext parser.
	self assert: context continuationStack = newContext continuationStack.

	self assert: newContext retval = 'foo'.