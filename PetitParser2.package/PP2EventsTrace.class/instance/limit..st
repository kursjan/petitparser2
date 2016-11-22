accessing
limit: eventsCollection
	| limit |
	
	eventsCollection isNil ifTrue: [ ^ entries size ].
	limit := 0.
		
	self interval do: [ :index | | e |
		e := self entries at: index.
		(eventsCollection includes: e event) ifTrue: [
			limit := limit + 1
		]
	].
	
	^ limit