visiting
visitLiteralSequence: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		false
	]