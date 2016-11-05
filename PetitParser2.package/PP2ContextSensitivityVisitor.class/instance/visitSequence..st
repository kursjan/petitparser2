as yet unclassified
visitSequence: node
	^ node propertyAt: #isContextSensitive ifAbsent: [ 
		super visitSequence: node.
		self sequenceResult: node
	]