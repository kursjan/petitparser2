testing-messages
testUnaryExpression1
	super testUnaryExpression1.
	self assert: self result isMessage.
	self assert: self result receiver isLiteralNode.
	self assert: self result selector equals: #abs.
	self assert: self result keywordsPositions equals: #(3) asIntegerArray.		
	self assert: self result arguments isEmpty