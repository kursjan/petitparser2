as yet unclassified
visitPP2Node: node
	^ node propertyAt: #isContextSensitive ifAbsent: [ 
		node children anySatisfy: [:child | self visit: child ]
	]