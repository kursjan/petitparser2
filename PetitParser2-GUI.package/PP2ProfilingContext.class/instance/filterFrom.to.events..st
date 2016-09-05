converting
filterFrom: start to: stop events: eventsCollection
	fPositions := OrderedCollection new.
	fEvents := OrderedCollection new.
	fSelectors := OrderedCollection new.
	"for the last stream only"
	
	(start to: stop) do: [ :index | | e |
		e := events at: index.
		(eventsCollection isNil or: [ eventsCollection includes: e ]) ifTrue: [
			fPositions addLast: (self positions at: index).
			fSelectors addLast: (self selectors at: index).
			fEvents addLast: e.
		]
	].
	
	^ fEvents