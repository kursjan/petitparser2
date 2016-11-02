visiting
visitAnd: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		false
	]