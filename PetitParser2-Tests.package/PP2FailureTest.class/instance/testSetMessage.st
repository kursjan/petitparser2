tests
testSetMessage
	context := PP2Failure new
 		position: #postion;
		stream: #stream;
		parser: #parser;
		message: #message.
		
	newContext := context setMessage: #anotherMessage.
	
	self deny: context == newContext.
	self assert: context position = newContext position.
	self assert: context stream = newContext stream.	
	self assert: context parser = newContext parser.