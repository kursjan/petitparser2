context
stackNamed: identifier
	^ self propertyAt: identifier ifAbsentPut: [ Stack new ]