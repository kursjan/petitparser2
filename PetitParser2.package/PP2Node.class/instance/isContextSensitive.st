analysis - context
isContextSensitive
	^ self propertyAt: #isContextSensitive ifAbsentPut: [  
		PP2ContextSensitivityVisitor new visit: self
	]