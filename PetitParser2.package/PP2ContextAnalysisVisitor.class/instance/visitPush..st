visiting
visitPush: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		true
	]