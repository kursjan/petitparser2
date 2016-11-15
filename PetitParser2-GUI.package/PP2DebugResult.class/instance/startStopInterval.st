accessing
startStopInterval
	(start isNil or: [stop isNil]) ifTrue: [ ^ 1 to: 0 ].
	
	^ start to: stop 