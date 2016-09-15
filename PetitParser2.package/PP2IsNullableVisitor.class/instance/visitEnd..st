visiting
visitEnd: node
	^ node propertyAt: #isNullable ifAbsent: [ 
		self visit: node child
	]