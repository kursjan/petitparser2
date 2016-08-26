testing
testStatements6
	super testStatements6.
	self assert: result isSequence.
	self assert: result temporaries isEmpty.
	self assert: result statements size equals: 2.
	self assert: result statements first isLiteralNode.
	self assert: result statements first value equals: 1.
	self assert: result statements first value isInteger.
	self assert: result statements second isLiteralNode.
	self assert: result statements second value equals: 2.
	self assert: result statements second value isInteger