validation
expectedForSource: source
	| result |
	result := parser parse: source.
	
	^ result isPetit2Failure ifFalse: [ 
		result value isCollection 
			ifTrue: [  result value ] 
			ifFalse: [ Array with: result value ]
	] ifTrue: [ 
		#failure
	]