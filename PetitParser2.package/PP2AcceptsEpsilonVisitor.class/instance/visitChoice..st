visiting
visitChoice: node
	^ node propertyAt: #acceptsEpsilon ifAbsent: [ 
		node children anySatisfy: [ :child | self visit: child  ]
	]