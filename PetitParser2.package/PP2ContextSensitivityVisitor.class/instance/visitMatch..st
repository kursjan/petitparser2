as yet unclassified
visitMatch: node
	^ node propertyAt: #isContextSensitive ifAbsent: [ 
		true
	]