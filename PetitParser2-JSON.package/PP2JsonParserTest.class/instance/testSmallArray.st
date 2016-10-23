testing-array
testSmallArray
	self parse: '["a"]'.
	self assert: (result isKindOf: Array).
	self assert: result size = 1.
	self assert: result first = 'a'.