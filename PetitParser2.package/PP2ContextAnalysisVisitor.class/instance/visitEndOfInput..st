visiting
visitEndOfInput: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		false
	]