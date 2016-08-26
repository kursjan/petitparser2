testing-messages
testKeywordMethod2
	super testKeywordMethod2.
	self assert: result isMethod.
	self assert: result selector equals: #to:do:.
	self assert: result keywordsPositions equals: #(1 7) asIntegerArray.		
	self assert: result arguments size equals: 2.
	self assert: result arguments first isVariable.
	self assert: result arguments first name equals: 'a'.
	self assert: result arguments second isVariable.
	self assert: result arguments second name equals: 'b'.
	self assert: result body temporaries size equals: 1.
	self assert: result body statements isEmpty