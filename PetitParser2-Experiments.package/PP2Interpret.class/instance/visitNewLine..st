visiting
visitNewLine: parser
	currentContext atEnd ifTrue: [ 
		^ PP2Failure message: 'I was not expected to pass' context: currentContext 
	].

    currentContext uncheckedPeek == Character lf ifTrue: [ 
		  currentContext shift.
        ^ String lf
    ].

	(currentContext uncheckedPeek == Character cr) ifTrue: [ 
		currentContext shift.
		(currentContext peek == Character lf) ifTrue: [ 
			currentContext shift.
			^ String crlf
       ].
       ^ String cr
	].

    ^ PP2Failure message: 'I was not expected to pass' context: currentContext