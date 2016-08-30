analysis - first
firstSet
	^ self propertyAt: #firstSet ifAbsentPut: [
		PP2FirstSetVisitor new visit: self
	]