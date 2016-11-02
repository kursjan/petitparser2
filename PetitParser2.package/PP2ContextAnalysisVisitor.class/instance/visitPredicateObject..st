visiting
visitPredicateObject: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		false
	]