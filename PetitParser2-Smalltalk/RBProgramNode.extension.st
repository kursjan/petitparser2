Extension { #name : #RBProgramNode }

{ #category : #'*PetitParser2-Smalltalk' }
RBProgramNode >> pp2AddComments: aCollectionOfIntervals [
	(aCollectionOfIntervals isNil or: [ aCollectionOfIntervals isEmpty ])
		ifFalse: [ self comments: self comments , aCollectionOfIntervals ]
]
