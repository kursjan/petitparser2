instance creation
instance
	Instance isNil ifTrue: [  
		Instance := self new
	].

	^ Instance