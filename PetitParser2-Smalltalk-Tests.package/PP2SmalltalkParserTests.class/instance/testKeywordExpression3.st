testing-messages
testKeywordExpression3
	super testKeywordExpression3.
	self assert: result isMessage.
	self assert: result receiver isLiteralNode.
	self assert: result selector equals: #to:by:do:.
	self assert: result keywordsPositions equals: #(3 9 15) asIntegerArray.
	self assert: result arguments size equals: 3.
	self assert: result arguments first isLiteralNode.
	self assert: result arguments first value equals: 2.
	self assert: result arguments second isLiteralNode.
	self assert: result arguments second value equals: 3.
	self assert: result arguments third isLiteralNode.
	self assert: result arguments third value equals: 4