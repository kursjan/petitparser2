visiting
visitDelegate: node
	^ node propertyAt: #isNullable ifAbsent: [ 
		self visit: node child
	]