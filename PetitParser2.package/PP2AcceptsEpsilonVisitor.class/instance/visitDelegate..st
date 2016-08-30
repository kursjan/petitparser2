visiting
visitDelegate: node
	^ node propertyAt: #acceptsEpsilon ifAbsent: [ 
		self visit: node child
	]