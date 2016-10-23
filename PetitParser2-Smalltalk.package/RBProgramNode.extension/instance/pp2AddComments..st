*PetitParser2-Smalltalk
pp2AddComments: aCollectionOfIntervals
	(aCollectionOfIntervals isNil or: [ aCollectionOfIntervals isEmpty ])
		ifFalse: [ self comments: self comments , aCollectionOfIntervals ]