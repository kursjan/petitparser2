as yet unclassified
colorForEvent: event
	| eventSet |
	event == #namedInvoked ifTrue: [ ^ Color green muchDarker ].
	
	colors isNil ifTrue: [ 
		eventSet := (entries collect: #event) asIdentitySet asArray.
		colors := RTMultiLinearColorForIdentity new objects: eventSet.
	].
	^ colors 	rtValue: event