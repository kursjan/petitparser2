converting
eventsTrace
	| trace |
	trace := OrderedCollection new.
	1 to: (10*1000 min: positions size) do: [ :index | 
		trace addLast: { positions at: index . events at: index . strategies at: index . selectors at: index }
	].

	^ trace