profiling
switchToProfiling: strategy parent: nodeOrStrategy
	| profilingStrategy |
	profilingStrategy := strategy profiling.
	profilingStrategy == strategy ifTrue: [ ^ strategy ].
	nodeOrStrategy strategy: profilingStrategy.

	^ profilingStrategy 