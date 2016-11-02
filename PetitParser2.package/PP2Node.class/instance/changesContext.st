analysis - context
changesContext
	^ self propertyAt: #changesContext ifAbsentPut: [  
		PP2ContextAnalysisVisitor new visit: self
	]