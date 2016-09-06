testing
testStatements7
	super testStatements7.
	self assert: self result isSequence.
	self assert: self result temporaries isEmpty.
	self assert: self result statements size equals: 1.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements first value isInteger