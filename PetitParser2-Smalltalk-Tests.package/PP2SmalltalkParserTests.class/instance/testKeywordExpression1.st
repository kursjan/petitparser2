testing-messages
testKeywordExpression1
	super testKeywordExpression1.
	self assert: result isMessage.
	self assert: result receiver isLiteralNode.
	self assert: result receiver value equals: 1.
	self assert: result selector equals: #to:.
	self assert: result keywordsPositions equals: #(3) asIntegerArray.
	self assert: result arguments size equals: 1.
	self assert: result arguments first isLiteralNode.
	self assert: result arguments first value equals: 2