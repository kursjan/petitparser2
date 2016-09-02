accessing
allChildren
	^ (strategy allChildren) 
		addFirst: self;
		yourself