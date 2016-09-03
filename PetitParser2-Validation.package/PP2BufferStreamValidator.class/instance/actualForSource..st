validation
actualForSource: source
	| result |
	
	[
		result := parser parse: (PP2BufferStream on: (PP2MinimalStream on: source) bufferSize: 64).
	] on: SubscriptOutOfBounds do: [  
		(PP2SkipValidation reason: 'To small buffer') signal
	].

	^ result isPetit2Failure ifFalse: [ 
		result value isCollection 
			ifTrue: [  result value ] 
			ifFalse: [ Array with: result value ]
	] ifTrue: [ 
		#failure
	]