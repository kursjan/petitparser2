visiting
visitWrapping: node
	^ node propertyAt: #acceptsEpsilon ifAbsent: [ 
		"Be conservative, we don't know for sure, so it is safer to report false"
		false
	]