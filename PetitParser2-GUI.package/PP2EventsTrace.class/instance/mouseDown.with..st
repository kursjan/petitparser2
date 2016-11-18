converting
mouseDown: anEvent with: aMorph
	| location msg |
	location := anEvent position.
	(location  y < fEntries size and: [ location y > 0 ]) ifTrue: [ 
		msg := ((fEntries position at: location y) asString, ':', (fEntries event at: location y), ': ', (fEntries node at: location y) asString).
		aMorph showBalloon: msg.
		Transcript cr; show: msg.
	]