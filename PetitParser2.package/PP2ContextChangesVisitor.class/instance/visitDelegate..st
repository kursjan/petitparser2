visiting
visitDelegate: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		self visit: node child
	]