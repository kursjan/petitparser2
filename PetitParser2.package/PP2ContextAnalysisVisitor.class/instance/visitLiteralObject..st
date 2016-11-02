visiting
visitLiteralObject: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		false
	]