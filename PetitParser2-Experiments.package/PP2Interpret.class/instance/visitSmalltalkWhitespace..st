visiting - extras
visitSmalltalkWhitespace: node	
	[ 
		[ currentContext atEnd not and: [ currentContext uncheckedPeek isSeparator ]] whileTrue: [ 
			currentContext shift 
		].
	
		(currentContext atEnd not and: [ currentContext uncheckedPeek = $" ]) 
	] whileTrue: [
		currentContext shift.
		currentContext upTo: $".
	].
