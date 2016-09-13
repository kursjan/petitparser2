tests
assert: node hasProperty: propertyName withValue: propertyValue
	self assert: (node propertyAt: propertyName) equals: propertyValue