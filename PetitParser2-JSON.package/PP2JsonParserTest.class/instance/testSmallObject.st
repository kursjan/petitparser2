testing-objects
testSmallObject
	self parse: '{"a":1}'.
	self assert: (result isKindOf: Dictionary).
	self assert: result size = 1.
	self assert: (result at: 'a') = 1