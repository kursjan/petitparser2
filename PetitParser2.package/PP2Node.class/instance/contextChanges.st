analysis - context
contextChanges
	^ self propertyAt: #contextChanges ifAbsentPut: [  
		PP2ContextAnalysisVisitor new visit: self
	]