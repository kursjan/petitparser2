testing-objects
testNestedObject
	self parse: '{"object":{"1":"2"}} '.
	self assert: (result isKindOf: Dictionary).
	self assert: result size = 1.
	
	result := result at: 'object'.
	self assert: (result isKindOf: Dictionary).
	self assert: result size = 1.
	self assert: (result at: '1') = '2'.