parsing
parseOn: aPP2Context
	[ 
		[ aPP2Context atEnd not and: [ aPP2Context uncheckedPeek isSeparator ]] whileTrue: [ 
			aPP2Context shift 
		].
	
		(aPP2Context atEnd not and: [ aPP2Context uncheckedPeek = $" ]) 
	] whileTrue: [
		aPP2Context shift.
		aPP2Context upTo: $".
	].

	^ failure