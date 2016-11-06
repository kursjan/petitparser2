context
stackNamed: identifier
	^ self propertyAt: identifier ifAbsentPut: [ PP2Stack new ]