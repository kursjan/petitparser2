tests - element
testElementMalformed
	self parse: '<foo><bar>meh</baz></foo>' rule: #element.
	self parse: '<foo><bar>meh</bar></fii></foo>' rule: #element