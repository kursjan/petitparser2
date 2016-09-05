visiting
visitComposite: node
	^ node propertyAt: #neverFails ifAbsent: [ 
		self visit: node child 
	]