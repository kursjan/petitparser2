parsing
parseOn: context
	context atEnd ifTrue: [ ^ failure ].
	
	(context uncheckedPeek == Character lf) ifTrue: [ 
		context shift.
		^ String lf
	].

	(context uncheckedPeek == Character cr) ifTrue: [  
		context shift.
		(context peek == Character lf) ifTrue: [ 
			context shift.
			^ String crlf.
		].
		^ String cr
	].

	^ failure