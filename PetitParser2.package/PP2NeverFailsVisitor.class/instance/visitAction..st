visiting
visitAction: node
	^ node propertyAt: #neverFails ifAbsent: [ 
		self visit: node child 
	]