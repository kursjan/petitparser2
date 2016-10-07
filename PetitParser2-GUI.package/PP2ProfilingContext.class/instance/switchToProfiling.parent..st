profiling
switchToProfiling: strategy parent: nodeOrStrategy
	| profilingStrategy |
	profilingStrategy := strategy profiling.
	
	profilingStrategy == strategy ifTrue: [ ^ self ].
	nodeOrStrategy changeStrategy: profilingStrategy.