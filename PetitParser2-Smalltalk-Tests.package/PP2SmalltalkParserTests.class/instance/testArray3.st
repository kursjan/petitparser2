testing
testArray3
	super testArray3.
	self assert: result isArray.
	self assert: result periods size equals: 1.
	self assert: result statements size equals: 2.
	self assert: result statements first isMessage.
	self assert: result statements first selector equals: #foo.
	self assert: result statements last isMessage.
	self assert: result statements last selector equals: #bar