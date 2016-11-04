as yet unclassified
visitChoice: node
	^ node propertyAt: #isContextSensitive ifAbsent: [ 
		node children anySatisfy: [:child | self visit: child ]
	]