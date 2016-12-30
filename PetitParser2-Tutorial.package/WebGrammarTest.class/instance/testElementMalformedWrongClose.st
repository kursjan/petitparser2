tests
testElementMalformedWrongClose
	self parse: '<foo><bar>meh</baz></foo>' rule: #element.
