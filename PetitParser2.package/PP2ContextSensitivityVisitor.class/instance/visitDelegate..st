as yet unclassified
visitDelegate: node
	^ node propertyAt: #isContextSensitive ifAbsent: [ 
		self visit: node child
	]