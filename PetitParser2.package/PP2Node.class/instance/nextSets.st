analysis - next
nextSets
	^ self propertyAt: #nextSets ifAbsent: [  
		(PP2NextSetsVisitor new )
			visit: self;
			nextSets.
	]