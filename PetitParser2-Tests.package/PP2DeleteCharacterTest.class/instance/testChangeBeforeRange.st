tests
testChangeBeforeRange
	change position: 2.

	self assert: (change changeBeforeRange: 4).
	self assert: (change changeBeforeRange: 3).

	self deny: (change changeBeforeRange: 2).