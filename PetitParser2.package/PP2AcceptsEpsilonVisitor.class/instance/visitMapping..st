visiting
visitMapping: node
	^ node propertyAt: #acceptsEpsilon ifAbsent: [ 
		self visit: node child 
	]