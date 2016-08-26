testing
testArray2
	super testArray2.
	self assert: result isArray.
	self assert: result periods isEmpty.
	self assert: result statements size equals: 1.
	self assert: result statements first isMessage.
	self assert: result statements first selector equals: #foo