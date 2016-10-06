accessing
instance
	Instance isNil ifTrue: [  
		Instance := PP2NodeFactory new
	].

	^ Instance