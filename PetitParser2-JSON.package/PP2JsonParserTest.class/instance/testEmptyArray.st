testing-array
testEmptyArray
	self parse: '[]'.
	self assert: (result isKindOf: Array).
	self assert: result isEmpty