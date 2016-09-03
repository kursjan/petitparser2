validation
actualForSource: source
	| result |
	result := optimizedParser parse: source.
	^ result isPetit2Failure ifFalse: [ 
		result value
	] ifTrue: [ 
		#failure
	]