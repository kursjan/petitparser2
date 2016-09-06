testing-messages
testUnaryMethod2
	super testUnaryMethod2.
	self assert: self result isMethod.
	self assert: self result selector equals: #abs.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.			
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty