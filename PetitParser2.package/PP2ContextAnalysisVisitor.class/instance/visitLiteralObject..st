visiting
visitLiteralObject: node
	^ node propertyAt: #contextChanges ifAbsentPut: [ 
		PP2CaResult noChange 
	]