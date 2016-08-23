as yet unclassified
expectedForSource: source
	| result |
	result := ppParser parse: source.
	
	^ result isPetitFailure ifFalse: [ 
		result
	] ifTrue: [ 
		#failure
	]