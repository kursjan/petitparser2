validation
expectedForSource: source
	| result |
	result := parser parse: source.
	
	^ result isPetit2Failure ifFalse: [ 
		result value
	] ifTrue: [ 
		#failure
	]