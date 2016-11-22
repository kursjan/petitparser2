private
filterEvents: eventsCollection
	fEntries := OrderedCollection new.
	self halt: 'obsolete?'.	
	self interval do: [ :index | | e |
		e := self entries at: index.
		(eventsCollection isNil or: [ eventsCollection includes: e event]) ifTrue: [
			fEntries add: e.
		]
	].
	
	^ fEntries