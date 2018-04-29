visiting
visitMatch: node
	^ node propertyAt: #isContextSensitive ifAbsent: [ 
		true
	]