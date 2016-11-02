accessing
instance
	instance isNil ifTrue: [ 
		instance := PP2EpsilonNode basicNew initialize
	].
	instance resetStrategies.
	^ instance