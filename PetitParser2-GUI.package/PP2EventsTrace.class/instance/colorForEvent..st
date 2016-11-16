private
colorForEvent: event
	| eventSet |
	colors isNil ifTrue: [ 
		eventSet := fEvents asIdentitySet asArray.
		colors := RTMultiLinearColorForIdentity new objects: eventSet.
	].
	^ colors 	rtValue: event