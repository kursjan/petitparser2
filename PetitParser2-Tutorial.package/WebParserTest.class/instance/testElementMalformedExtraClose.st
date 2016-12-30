tests
testElementMalformedExtraClose
	super testElementMalformedExtraClose.
	
	self assert: result name equals: 'foo'.
	self assert: result secondChild text equals: '</fii>'
