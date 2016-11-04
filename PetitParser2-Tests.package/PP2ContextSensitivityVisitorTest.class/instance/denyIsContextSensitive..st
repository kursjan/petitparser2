asserting
denyIsContextSensitive: node
	self deny: (visitor visit: node) description: 'should not be context sensitive'