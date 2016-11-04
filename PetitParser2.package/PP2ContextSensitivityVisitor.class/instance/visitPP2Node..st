as yet unclassified
visitPP2Node: node
	^ node propertyAt: #isContextSensitive ifAbsentPut: [ 
		node children anySatisfy: [:child | self visit: child ]
	]