tests
testCopy
	| stream newContext context |
	stream := 'foo' asPetit2Stream.
	
	context := PP2InMemoryContext new
		stream: stream;
 		position: 1;
		parser: #parser;
		continuationStack: #continuationStack;
		yourself.
		
	newContext := context copy.
	
	self deny: context == newContext.
	self assert: context position = newContext position.
	self assert: context contents = newContext contents.	
	self assert: context parser = newContext parser.
	self assert: context continuationStack = newContext continuationStack.