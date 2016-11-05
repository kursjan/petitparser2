analysis - context
contextChanges
	^ self propertyAt: #contextChanges ifAbsent: [  
		PP2ContextChangesVisitor new visit: self
	]