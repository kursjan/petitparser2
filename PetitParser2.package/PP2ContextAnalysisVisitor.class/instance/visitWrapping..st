visiting
visitWrapping: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		^ true
	]