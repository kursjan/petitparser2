visiting
visitEpsilon: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		false
	]