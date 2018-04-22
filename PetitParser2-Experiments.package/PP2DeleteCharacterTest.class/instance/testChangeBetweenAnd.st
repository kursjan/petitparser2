tests
testChangeBetweenAnd
	change position: 2.

	self assert: (change changeBetween: 2 and: 2).
	self assert: (change changeBetween: 2 and: 3).
	self assert: (change changeBetween: 1 and: 2).
	self assert: (change changeBetween: 1 and: 1).

	self deny: (change changeBetween: 3 and: 3).

