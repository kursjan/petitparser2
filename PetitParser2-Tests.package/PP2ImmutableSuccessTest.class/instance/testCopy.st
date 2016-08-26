tests
testCopy
	context := PP2ImmutableSuccess new
		retval: #retval.
		
	newContext := context copy.
	
	self assert: context retval = newContext retval.