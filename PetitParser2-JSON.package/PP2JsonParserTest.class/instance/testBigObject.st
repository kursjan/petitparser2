testing-objects
testBigObject
	self parse: ' { "a" : 1 , "b" : 2 } '.
	self assert: (result isKindOf: Dictionary).
	self assert: result size = 2.
	self assert: (result at: 'a') = 1.
	self assert: (result at: 'b') = 2.