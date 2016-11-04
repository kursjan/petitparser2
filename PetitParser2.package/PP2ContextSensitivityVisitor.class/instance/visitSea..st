as yet unclassified
visitSea: node
	^ node propertyAt: #isContextSensitive ifAbsent: [ 
		node children anySatisfy: [:child | self visit: child ]
	]