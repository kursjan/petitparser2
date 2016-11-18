private
colorForEvent: event
	| eventSet |
	colors isNil ifTrue: [ 
		eventSet := (fEntries collect: #event) asIdentitySet asArray.
		colors := RTMultiLinearColorForIdentity new objects: eventSet.
	].
	^ colors 	rtValue: event