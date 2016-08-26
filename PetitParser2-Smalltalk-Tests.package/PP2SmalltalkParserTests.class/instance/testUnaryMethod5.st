testing-messages
testUnaryMethod5
	super testUnaryMethod5.
	self assert: result isMethod.
	self assert: result selector equals: #abs.
	self assert: result keywordsPositions equals: #(1) asIntegerArray.		
	self assert: result arguments isEmpty.
	self assert: result body temporaries size equals: 1.
	self assert: result body statements isEmpty