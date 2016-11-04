visiting
visitSequence: node
	^ node propertyAt: #contextChanges ifAbsentPut: [ 
		self sequenceResult: node
	]