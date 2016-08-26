instance creation
instance
	instance isNil ifTrue: [ 
		instance := self new
	].
	^ instance 