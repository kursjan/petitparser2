visiting
visitAdaptable: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange change
	]