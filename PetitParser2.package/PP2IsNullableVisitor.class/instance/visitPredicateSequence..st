visiting
visitPredicateSequence: node
	^ node propertyAt: #isNullable ifAbsent: [ 
		node size = 0
	]