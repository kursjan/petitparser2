testing-messages
testKeywordMethod2
	super testKeywordMethod2.
	self assert: self result isMethod.
	self assert: self result selector equals: #to:do:.
	self assert: self result keywordsPositions equals: #(1 7) asIntegerArray.		
	self assert: self result arguments size equals: 2.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result arguments second isVariable.
	self assert: self result arguments second name equals: 'b'.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty