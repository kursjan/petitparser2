tests
testCopy
	context := PP2ImmutableFailure new
		message: #message.
		
	newContext := context copy.
	
	self assert: context message = newContext message.