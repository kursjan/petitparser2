tests
testElementMalformedUnclosed
	self parse: '<head><meta content="mess"></head>' rule: #element.
