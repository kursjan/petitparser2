instance creation
instance
	instance isNil ifTrue: [ 
		instance := self new
	].
	"
		I would rather not to see this as a singleton
		
		The reason to reset is that optimizations set some strategies. And these will not get 
		restored.
	"
	instance resetStrategies.
	^ instance 