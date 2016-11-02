visiting
visitDelegate: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		self visit: node child
	]