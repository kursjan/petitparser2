reporting
countFor: event
	| count |
	count := 0.
	entries do: [ :e |
		(e event == event) ifTrue: [ count := count + 1 ].
	].
	^ count