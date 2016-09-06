testing-messages
testCascadeExpression1
	super testCascadeExpression1.
	self assert: self result isCascade.
	self assert: self result receiver isLiteralNode.
	self assert: self result messages size equals: 2.
	self assert: self result messages first receiver equals: self result receiver.
	self assert: self result messages first selector equals: #abs.
	self assert: self result messages first keywordsPositions equals: #(3) asIntegerArray.
	self assert: self result messages second receiver equals: self result receiver.
	self assert: self result messages second selector equals: #negated.
	self assert: self result messages second keywordsPositions equals: #(8) asIntegerArray