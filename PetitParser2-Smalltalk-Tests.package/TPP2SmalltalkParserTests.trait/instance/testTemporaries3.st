testing
testTemporaries3
	super testTemporaries3.
	self assert: self result isSequence.
	self assert: self result temporaries size equals: 3.
	self assert: self result temporaries first isVariable.
	self assert: self result temporaries first name equals: 'a'.
	self assert: self result temporaries second isVariable.
	self assert: self result temporaries second name equals: 'b'.
	self assert: self result temporaries third isVariable.
	self assert: self result temporaries third name equals: 'c'.
	self assert: self result statements isEmpty