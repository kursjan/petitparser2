visiting
visitMatch: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		true
	]