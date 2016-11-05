visiting
visitSequence: node
	^ node propertyAt: #contextChanges ifAbsent: [ 
		self sequenceResult: node
	]