as yet unclassified
visitTerminal: node
	^ node propertyAt: #isContextSensitive ifAbsent: [ 
		false
	]