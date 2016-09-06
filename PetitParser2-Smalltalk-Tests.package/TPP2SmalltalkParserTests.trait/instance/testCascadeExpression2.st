testing-messages
testCascadeExpression2
	super testCascadeExpression2.
	self assert: self result isCascade.
	self assert: self result receiver isMessage.
	self assert: self result receiver receiver isLiteralNode.
	self assert: self result receiver receiver value equals: 1.
	self assert: self result receiver selector equals: #abs.
	self assert: self result receiver keywordsPositions equals: #(3) asIntegerArray.
	self assert: self result messages size equals: 3.
	self assert: self result messages first receiver equals: self result receiver.
	self assert: self result messages first selector equals: #negated.
	self assert: self result messages first keywordsPositions equals: #(7) asIntegerArray.
	self assert: self result messages second receiver equals: self result receiver.
	self assert: self result messages second selector equals: #raisedTo:.
	self assert: self result messages second keywordsPositions equals: #(16) asIntegerArray.
	self assert: self result messages third receiver equals: self result receiver.
	self assert: self result messages third selector equals: #negated.
	self assert: self result messages third keywordsPositions equals: #(30) asIntegerArray