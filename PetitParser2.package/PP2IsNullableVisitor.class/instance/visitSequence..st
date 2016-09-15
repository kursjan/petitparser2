visiting
visitSequence: node
	^ node propertyAt: #isNullable ifAbsent: [ 
		node children allSatisfy: [ :child | self visit: child  ]
	]