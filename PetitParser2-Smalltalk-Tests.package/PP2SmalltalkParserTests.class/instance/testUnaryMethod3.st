testing-messages
testUnaryMethod3
	super testUnaryMethod3.
	self assert: result isMethod.
	self assert: result selector equals: #abs.
	self assert: result keywordsPositions equals: #(1) asIntegerArray.			
	self assert: result arguments isEmpty.
	self assert: result body temporaries isEmpty.
	self assert: result body statements size equals: 1