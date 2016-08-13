as yet unclassified
actualForSource: source
	| result |
	
	[
		result := pp2Parser parse: (PP2BufferStream on: (MinimalStream on: source) bufferSize: 128).
	] on: SubscriptOutOfBounds do: [  
		(SkipValidation reason: 'To small buffer') signal
	].

	^ result isPetit2Failure ifFalse: [ 
		result value
	] ifTrue: [ 
		#failure
	]