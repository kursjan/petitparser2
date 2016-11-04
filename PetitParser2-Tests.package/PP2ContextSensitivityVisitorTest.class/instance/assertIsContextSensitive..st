asserting
assertIsContextSensitive: node
	self assert: (visitor visit: node) description: 'should be context sensitive'