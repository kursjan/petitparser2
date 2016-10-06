*PetitParser2-Seas
firstSeasOrTerminalsSet
	^ self propertyAt: #firstSeasOrTerminals ifAbsent: [
		PP2FirstSetVisitor seasOrTerminalsSet visit: self
	]