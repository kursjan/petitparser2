visiting
visitChoice: node
	^ node propertyAt: #isNullable ifAbsent: [ 
		node children anySatisfy: [ :child | self visit: child  ]
	]