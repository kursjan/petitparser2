testing-messages
testUnaryMethod1
	super testUnaryMethod1.
	self assert: result isMethod.
	self assert: result selector equals: #abs.
	self assert: result keywordsPositions equals: #(1) asIntegerArray.		
	self assert: result arguments isEmpty.
	self assert: result body temporaries isEmpty.
	self assert: result body statements isEmpty