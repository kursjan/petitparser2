visiting
visitTerminal: node
	^ node propertyAt: #isContextSensitive ifAbsent: [ 
		false
	]