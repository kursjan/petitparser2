as yet unclassified
visitDelegate: node
	^ node propertyAt: #isContextSensitive ifAbsentPut: [ 
		self visit: node child
	]