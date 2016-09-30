analysis - first
firstProductionSet
	^ self propertyAt: #firstProductionSet ifAbsent: [
		PP2FirstSetVisitor productionSet visit: self
	]