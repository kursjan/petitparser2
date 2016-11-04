visiting
visitWrapping: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		^ PP2CaChange change
	]