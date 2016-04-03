tests
testCopy
	context := PP2Failure new
		message: #message.
		
	newContext := context copy.
	
	self assert: context message = newContext message.