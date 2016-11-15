private
colorForEvent: event
	| eventSet |
	colors isNil ifTrue: [ 
		eventSet := events asIdentitySet asArray.
		colors := RTMultiLinearColorForIdentity new objects: eventSet.
	].
	^ colors 	rtValue: event