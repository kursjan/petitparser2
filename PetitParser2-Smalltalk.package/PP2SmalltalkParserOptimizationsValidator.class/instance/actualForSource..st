validation
actualForSource: source
	| result |
	result := optimizedParser parse: source.
	^ result isPetit2Failure ifFalse: [ 
		Array with: result value
	] ifTrue: [ 
		#failure
	]