tests
testCopy
	context := PP2Success new
		retval: #retval.
		
	newContext := context copy.
	
	self assert: context retval = newContext retval.