visiting
visitSea: node
	^ node propertyAt: #contextChanges ifAbsentPut: [ 
		self assert: (self visit: node beforeWater) isContextChange not.
		self assert: (self visit: node afterWater) isContextChange not.
		^ self visit: node island
	]