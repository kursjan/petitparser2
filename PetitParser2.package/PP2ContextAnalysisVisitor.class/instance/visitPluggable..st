visiting
visitPluggable: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		^ PP2CaChange change
	]