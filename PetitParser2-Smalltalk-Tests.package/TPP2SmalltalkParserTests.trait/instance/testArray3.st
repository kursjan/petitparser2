testing
testArray3
	super testArray3.
	self assert: self result periods size equals: 1.
	self assert: self result statements size equals: 2.
	self assert: self result statements first isMessage.
	self assert: self result statements first selector equals: #foo.
	self assert: self result statements last isMessage.
	self assert: self result statements last selector equals: #bar