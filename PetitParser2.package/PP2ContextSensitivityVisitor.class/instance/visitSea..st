as yet unclassified
visitSea: node
	^ node propertyAt: #isContextSensitive ifAbsentPut: [ 
		node children anySatisfy: [:child | self visit: child ]
	]