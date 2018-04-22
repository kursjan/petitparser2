asserting
shouldMemoize: node
	^ node propertyAt: #reparsable ifAbsent: [ false ]