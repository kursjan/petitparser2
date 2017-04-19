testing
testArray2
	super testArray2.
	self assert: self result periods isEmpty.
	self assert: self result statements size equals: 1.
	self assert: self result statements first isMessage.
	self assert: self result statements first selector equals: #foo