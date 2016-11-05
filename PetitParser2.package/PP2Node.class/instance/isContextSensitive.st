analysis - context
isContextSensitive
	^ self propertyAt: #isContextSensitive ifAbsent: [  
		PP2ContextSensitivityVisitor new visit: self
	]