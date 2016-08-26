testing
testTemporaries2
	super testTemporaries2.
	self assert: result isSequence.
	self assert: result temporaries size equals: 2.
	self assert: result temporaries first isVariable.
	self assert: result temporaries first name equals: 'a'.
	self assert: result temporaries second isVariable.
	self assert: result temporaries second name equals: 'b'.
	self assert: result statements isEmpty