converting
mouseDown: anEvent with: aMorph
	| location msg |
	location := anEvent position.
	(location  y < fEvents size and: [ location y > 0 ]) ifTrue: [ 
		msg := ((fPositions at: location y) asString, ':', (fEvents at: location y), ': ', (fNodes at: location y) asString).
		aMorph showBalloon: msg.
		Transcript cr; show: msg.
	]