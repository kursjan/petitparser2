reporting
countFor: event
	| count |
	count := 0.
	self eventsTrace entriesDo: [ :e |
		(e event == event) ifTrue: [ count := count + 1 ].
	].
	^ count