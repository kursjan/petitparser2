tests
testSetValue
	context := PP2ImmutableSuccess new
 		position: #postion;
		stream: #stream;
		parser: #parser;
		retval: #retval.
		
	newContext := context setValue: #anotherVal.
	
	self deny: context == newContext.
	self assert: context position = newContext position.
	self assert: context stream = newContext stream.	
	self assert: context parser = newContext parser.