profiling
switchToProfiling: strategy parent: nodeOrStrategy
	| profilingStrategy |
	profilingStrategy := strategy recording.
	profilingStrategy == strategy ifTrue: [ ^ strategy ].
	nodeOrStrategy strategy: profilingStrategy.

	^ profilingStrategy 