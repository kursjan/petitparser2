tests
testElementNested
	super testElementNested.
	
	self assert: result name equals: 'p'.
	self assert: result firstChild text trim equals: 'lorem'.
	self assert: result secondChild name equals: 'i'.
	self assert: result secondChild firstChild text equals: 'ipsum'