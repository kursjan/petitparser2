testing-messages
testUnaryMethod1
	super testUnaryMethod1.
	self assert: self result isMethod.
	self assert: self result selector equals: #abs.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.		
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty