as yet unclassified
testElementMalformed
	self parse: '<foo><bar>meh</baz></foo>' rule: #element.
	
	self flag: 'parse this!'.
"	self parse: '<foo><bar>meh</bar></fii></foo>' rule: #element"