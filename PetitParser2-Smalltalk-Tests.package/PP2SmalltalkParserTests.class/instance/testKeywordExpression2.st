testing-messages
testKeywordExpression2
	super testKeywordExpression2.
	self assert: result isMessage.
	self assert: result receiver isLiteralNode.
	self assert: result selector equals: #to:by:.
	self assert: result keywordsPositions equals: #(3 9) asIntegerArray.
	self assert: result arguments size equals: 2.
	self assert: result arguments first isLiteralNode.
	self assert: result arguments first value equals: 2.
	self assert: result arguments second isLiteralNode.
	self assert: result arguments second value equals: 3