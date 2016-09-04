profiling
switchToProfiling: strategy parent: parent
	| profilingStrategy |
	profilingStrategy := strategy profiling.
	
	profilingStrategy == strategy ifTrue: [ ^ self ].
	parent changeStrategy: profilingStrategy.