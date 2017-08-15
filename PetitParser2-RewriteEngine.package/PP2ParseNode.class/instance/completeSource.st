accessing
completeSource
	^ parent isNil
		ifTrue: [ completeSource ]
		ifFalse: [ parent completeSource ]