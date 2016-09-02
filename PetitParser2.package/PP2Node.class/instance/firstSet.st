analysis - first
firstSet
	^ self propertyAt: #firstSet ifAbsentPut: [
		PP2FirstSetVisitor firstSet visit: self
	]