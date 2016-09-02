visiting
visitSequence: node
	^ node propertyAt: #neverFails ifAbsent: [ 
		node children allSatisfy: [ :child | self visit: child  ]
	]