testing-array
testBigArray
	self parse: ' [ "a" , "b" ] '.
	self assert: (result isKindOf: Array).
	self assert: result size = 2.
	self assert: result first = 'a'.
	self assert: result second = 'b'.