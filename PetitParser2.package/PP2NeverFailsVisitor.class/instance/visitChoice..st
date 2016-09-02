visiting
visitChoice: node
	^ node propertyAt: #neverFails ifAbsent: [ 
		node children anySatisfy: [ :child | self visit: child  ]
	]