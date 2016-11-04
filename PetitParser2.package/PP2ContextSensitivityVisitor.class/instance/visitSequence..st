as yet unclassified
visitSequence: node
	^ node propertyAt: #isContextSensitive ifAbsentPut: [ 
		super visitSequence: node.
		self sequenceResult: node
	]