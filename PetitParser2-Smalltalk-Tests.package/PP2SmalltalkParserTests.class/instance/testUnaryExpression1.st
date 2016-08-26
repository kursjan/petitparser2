testing-messages
testUnaryExpression1
	super testUnaryExpression1.
	self assert: result isMessage.
	self assert: result receiver isLiteralNode.
	self assert: result selector equals: #abs.
	self assert: result keywordsPositions equals: #(3) asIntegerArray.		
	self assert: result arguments isEmpty