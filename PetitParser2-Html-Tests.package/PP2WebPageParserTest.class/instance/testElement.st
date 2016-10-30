tests
testElement
	super testElement.
	
	self assert: result name equals: 'p'.
	self assert: result firstChild text equals: 'lorem ipsum'