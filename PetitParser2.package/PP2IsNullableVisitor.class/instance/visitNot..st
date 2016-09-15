visiting
visitNot: node
	^ node propertyAt: #isNullable ifAbsent: [ 
		false
	]