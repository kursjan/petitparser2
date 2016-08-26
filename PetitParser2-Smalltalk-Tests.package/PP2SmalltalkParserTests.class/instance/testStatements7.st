testing
testStatements7
	super testStatements7.
	self assert: result isSequence.
	self assert: result temporaries isEmpty.
	self assert: result statements size equals: 1.
	self assert: result statements first isLiteralNode.
	self assert: result statements first value equals: 1.
	self assert: result statements first value isInteger