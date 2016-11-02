visiting
visitTrimming: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		node children anySatisfy: [:child | self visit: child ]
	]