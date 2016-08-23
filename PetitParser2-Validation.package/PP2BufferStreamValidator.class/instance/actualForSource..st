validation
actualForSource: source
	| result |
	
	[
		result := parser parse: (PP2BufferStream on: (MinimalStream on: source) bufferSize: 64).
	] on: SubscriptOutOfBounds do: [  
		(SkipValidation reason: 'To small buffer') signal
	].

	^ result isPetit2Failure ifFalse: [ 
		result value
	] ifTrue: [ 
		#failure
	]