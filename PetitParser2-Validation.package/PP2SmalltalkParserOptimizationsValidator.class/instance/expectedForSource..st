validation
expectedForSource: source
	| result |
	result := parser parse: source.
	
	^ result isPetit2Failure ifFalse: [ 
		Array with: result value
	] ifTrue: [ 
		#failure
	]