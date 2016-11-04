visiting
visitDelegate: node
	^ node propertyAt: #contextChanges ifAbsentPut: [ 
		self visit: node child
	]