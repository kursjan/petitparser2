visiting
visitSea: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		"
			These two asserts are probably not essential, but I cannot imagine the use case 
			right now. If it is the case, the logic should be re-written.
		"
		self assert: (self visit: node beforeWater) isContextChange not.
		self assert: (self visit: node afterWater) isContextChange not.
		^ self visit: node island
	]