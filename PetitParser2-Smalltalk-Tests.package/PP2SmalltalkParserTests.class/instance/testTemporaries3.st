testing
testTemporaries3
	super testTemporaries3.
	self assert: result isSequence.
	self assert: result temporaries size equals: 3.
	self assert: result temporaries first isVariable.
	self assert: result temporaries first name equals: 'a'.
	self assert: result temporaries second isVariable.
	self assert: result temporaries second name equals: 'b'.
	self assert: result temporaries third isVariable.
	self assert: result temporaries third name equals: 'c'.
	self assert: result statements isEmpty