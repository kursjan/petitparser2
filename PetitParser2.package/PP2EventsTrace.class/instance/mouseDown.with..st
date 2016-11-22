as yet unclassified
mouseDown: anEvent with: aMorph
	| location msg entry |
	location := anEvent position.
	(location  y < fEntries size and: [ location y > 0 ]) ifTrue: [ 
		entry := fEntries at: location y.
		msg := (entry position asString, ':', entry event, ': ', entry node asString).
		aMorph showBalloon: msg.
		Transcript cr; show: msg.
	]