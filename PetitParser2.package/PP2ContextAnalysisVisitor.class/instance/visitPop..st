visiting
visitPop: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		true
	]