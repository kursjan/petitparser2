tests
testStackId
	self assert: $a asPParser push stackId equals: #defaultStack.
	self assert: $a asPParser pop stackId equals: #defaultStack.	
	self assert: $a asPParser match stackId equals: #defaultStack.