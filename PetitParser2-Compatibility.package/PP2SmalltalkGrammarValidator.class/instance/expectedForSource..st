validation
expectedForSource: source
	| result |
	result := ppParser parse: source.
	
	^ result isPetitFailure ifFalse: [ 
		result deepFlatten
	] ifTrue: [ 
		#failure
	]