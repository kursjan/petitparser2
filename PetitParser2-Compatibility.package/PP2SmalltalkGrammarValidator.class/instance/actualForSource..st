validation
actualForSource: source
	| result |
	result := pp2Parser parse: source.
	
	^ result isPetit2Failure ifFalse: [ 
		result value deepFlatten.
	] ifTrue: [ 
		#failure
	]