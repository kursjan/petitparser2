testing-messages
testKeywordMethod3
	super testKeywordMethod3.
	self assert: self result isMethod.
	self assert: self result selector equals: #to:do:by:.
	self assert: self result keywordsPositions equals: #(1 7 13) asIntegerArray.			
	self assert: self result arguments size equals: 3.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result arguments second isVariable.
	self assert: self result arguments second name equals: 'b'.
	self assert: self result arguments third isVariable.
	self assert: self result arguments third name equals: 'c'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements size equals: 1