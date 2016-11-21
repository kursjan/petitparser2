converting
eventsTable
	| trace |
	trace := OrderedCollection new.
	1 to: (10*1000 min: eventsTrace entriesCount) do: [ :index | 
		trace addLast: { 
			(eventsTrace entryAt: index) position . 
			(eventsTrace entryAt: index) event . 
			(eventsTrace entryAt: index) strategy .
			(eventsTrace entryAt: index) node 
		}
	].

	^ trace