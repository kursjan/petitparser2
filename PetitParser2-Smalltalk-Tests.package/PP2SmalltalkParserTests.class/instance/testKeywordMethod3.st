testing-messages
testKeywordMethod3
	super testKeywordMethod3.
	self assert: result isMethod.
	self assert: result selector equals: #to:do:by:.
	self assert: result keywordsPositions equals: #(1 7 13) asIntegerArray.			
	self assert: result arguments size equals: 3.
	self assert: result arguments first isVariable.
	self assert: result arguments first name equals: 'a'.
	self assert: result arguments second isVariable.
	self assert: result arguments second name equals: 'b'.
	self assert: result arguments third isVariable.
	self assert: result arguments third name equals: 'c'.
	self assert: result body temporaries isEmpty.
	self assert: result body statements size equals: 1