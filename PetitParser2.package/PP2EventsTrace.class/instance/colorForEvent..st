as yet unclassified
colorForEvent: event
	| eventSet |
	event == #namedInvoked ifTrue: [ ^ Color green muchDarker ].
	
	colors isNil ifTrue: [ 
		eventSet := (entries collect: #event) asIdentitySet asArray.
		self flag: 'JK: Dependency on Roassal? Should probably move this method!'.
		colors := (Smalltalk at: #RTMultiLinearColorForIdentity) new objects: eventSet.
	].
	^ colors 	rtValue: event