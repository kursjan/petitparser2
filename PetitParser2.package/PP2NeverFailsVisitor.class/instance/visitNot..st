visiting
visitNot: node
	^ node propertyAt: #neverFails ifAbsent: [ 
		false
	]