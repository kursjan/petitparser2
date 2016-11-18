converting
eventsTable
	| trace |
	trace := OrderedCollection new.
	1 to: (10*1000 min: entries size) do: [ :index | 
		trace addLast: { 
			(entries at: index) position . 
			(entries at: index) event . 
			(entries at: index) strategy .
			(entries at: index) node 
		}
	].

	^ trace