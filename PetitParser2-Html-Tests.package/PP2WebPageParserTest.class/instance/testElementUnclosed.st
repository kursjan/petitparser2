tests
testElementUnclosed
	super testElementUnclosed.
	
	self assert: result name equals: 'head'.
	self assert: result firstChild text trim equals: '<meta content="mess">'