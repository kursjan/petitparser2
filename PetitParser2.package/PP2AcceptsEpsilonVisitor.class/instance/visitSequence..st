visiting
visitSequence: node
	^ node propertyAt: #acceptsEpsilon ifAbsent: [ 
		node children allSatisfy: [ :child | self visit: child  ]
	]