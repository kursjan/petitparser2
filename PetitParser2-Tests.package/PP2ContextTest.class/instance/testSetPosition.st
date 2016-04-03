testing
testSetPosition
	context := PP2Context new
 		position: #postion;
		stream: #stream;
		parser: #parser;
		continuationStack: #continuationStack;
		yourself.
		
	newContext := context setPosition: #newPosition.
	
	self deny: context == newContext.
	self deny: context position = newContext position.
	self assert: context stream = newContext stream.	
	self assert: context parser = newContext parser.
	self assert: context continuationStack = newContext continuationStack.