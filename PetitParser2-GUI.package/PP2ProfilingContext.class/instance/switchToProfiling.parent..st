profiling
switchToProfiling: strategy parent: nodeOrStrategy
	| profilingStrategy |
	profilingStrategy := strategy profiling.
	profilingStrategy == strategy ifTrue: [ ^ strategy ].
	nodeOrStrategy changeStrategy: profilingStrategy.

	^ profilingStrategy 