testing-messages
testCascadeExpression3
	super testCascadeExpression3.
	self assert: self result isCascade.
	self assert: self result receiver isLiteralNode.
	self assert: self result receiver value equals: 1.
	self assert: self result messages size equals: 2.
	self assert: self result messages first receiver equals: self result receiver.
	self assert: self result messages first selector equals: #+.
	self assert: self result messages first keywordsPositions equals: #(3) asIntegerArray.				
	self assert: self result messages first arguments size equals: 1.
	self assert: self result messages second receiver equals: self result receiver.
	self assert: self result messages second selector equals: #-.
	self assert: self result messages second keywordsPositions equals: #(8) asIntegerArray.				
	self assert: self result messages second arguments size equals: 1