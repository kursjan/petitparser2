tests
testElementMalformedWrongClose
	super testElementMalformedWrongClose.
	
	self assert: result name equals: 'foo'.
	self assert: result firstChild text equals: '<bar>meh</baz>'