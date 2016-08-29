converting
mouseDown: anEvent with: aMorph
	| location event |
	location := anEvent position.
	(location  y < fEvents size and: [ location y > 0 ]) ifTrue: [ 
		event := fEvents at: location y.
		Transcript cr; show: event; show: ': '; show: (fSelectors at: location y).
	]