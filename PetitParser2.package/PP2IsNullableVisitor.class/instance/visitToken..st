visiting
visitToken: node
	^ node propertyAt: #isNullable ifAbsent: [ 
		self visit: node child
	]