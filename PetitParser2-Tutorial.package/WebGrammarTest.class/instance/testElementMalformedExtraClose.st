tests
testElementMalformedExtraClose
	self parse: '<foo><bar>meh</bar></fii></foo>' rule: #element
