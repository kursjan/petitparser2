tests
testCopy
	| newContext context |
	context := PP2Context new
 		position: #postion;
		stream: #stream;
		parser: #parser;
		startMemento: #startMemento;
		yourself.
		
	newContext := context copy.
	
	self deny: context == newContext.
	self assert: context position = newContext position.
	self assert: context stream = newContext stream.	
	self assert: context parser = newContext parser.
	self assert: context startMemento = newContext startMemento.
