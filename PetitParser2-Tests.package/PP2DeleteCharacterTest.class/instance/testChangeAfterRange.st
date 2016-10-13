tests
testChangeAfterRange
	change position: 2.

	self assert: (change changeAfterRange: 0).

	self deny: (change changeAfterRange: 1).
	self deny: (change changeAfterRange: 2).