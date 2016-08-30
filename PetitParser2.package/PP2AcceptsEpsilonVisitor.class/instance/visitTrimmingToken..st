visiting
visitTrimmingToken: node
	^ node propertyAt: #acceptsEpsilon ifAbsent: [ 
		self visit: node child
	]