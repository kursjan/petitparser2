as yet unclassified
actualForSource: source
	| result |
	result := pp2Parser parse: (PP2BufferStream on: source asPetitStream bufferSize: 128).
	
	^ result isPetit2Failure ifFalse: [ 
		result value
	] ifTrue: [ 
		#failure
	]