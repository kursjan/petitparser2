testing-messages
testKeywordExpression3
	super testKeywordExpression3.
	self assert: self result isMessage.
	self assert: self result receiver isLiteralNode.
	self assert: self result selector equals: #to:by:do:.
	self assert: self result keywordsPositions equals: #(3 9 15) asIntegerArray.
	self assert: self result arguments size equals: 3.
	self assert: self result arguments first isLiteralNode.
	self assert: self result arguments first value equals: 2.
	self assert: self result arguments second isLiteralNode.
	self assert: self result arguments second value equals: 3.
	self assert: self result arguments third isLiteralNode.
	self assert: self result arguments third value equals: 4