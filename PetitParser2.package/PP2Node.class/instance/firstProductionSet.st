analysis - first
firstProductionSet
	^ self propertyAt: #firstProductionSet ifAbsentPut: [
		PP2FirstSetVisitor productionSet visit: self
	]