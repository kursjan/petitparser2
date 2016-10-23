testing-array
testNestedArray
	self parse: '[[2]]'.
	self assert: (result isKindOf: Array).
	self assert: result size = 1.
	
	result := result first.
	self assert: (result isKindOf: Array).
	self assert: result size = 1.
	self assert: result first = 2.