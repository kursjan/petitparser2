tests
testCopy
	| newContext context |
	context := PP2Context new
 		position: #postion;
		stream: #stream;
		parser: #parser;
		yourself.
		
	newContext := context copy.
	
	self deny: context == newContext.
	self assert: context position = newContext position.
	self assert: context stream = newContext stream.	
	self assert: context parser = newContext parser.
