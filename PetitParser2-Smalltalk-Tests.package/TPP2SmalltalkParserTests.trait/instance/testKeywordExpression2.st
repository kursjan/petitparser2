testing-messages
testKeywordExpression2
	super testKeywordExpression2.
	self assert: self result isMessage.
	self assert: self result receiver isLiteralNode.
	self assert: self result selector equals: #to:by:.
	self assert: self result keywordsPositions equals: #(3 9) asIntegerArray.
	self assert: self result arguments size equals: 2.
	self assert: self result arguments first isLiteralNode.
	self assert: self result arguments first value equals: 2.
	self assert: self result arguments second isLiteralNode.
	self assert: self result arguments second value equals: 3