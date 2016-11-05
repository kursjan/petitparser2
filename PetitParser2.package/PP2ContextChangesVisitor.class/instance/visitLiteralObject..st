visiting
visitLiteralObject: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcResult noChange 
	]