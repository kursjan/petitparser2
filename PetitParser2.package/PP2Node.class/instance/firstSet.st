analysis - first
firstSet
	^ self propertyAt: #firstSet ifAbsent: [
		PP2FirstSetVisitor firstSet visit: self
	]