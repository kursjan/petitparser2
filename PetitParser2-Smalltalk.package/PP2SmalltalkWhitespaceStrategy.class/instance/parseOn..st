parsing
parseOn: aPP2Context
	[ 
		[ aPP2Context peek isSeparator ] whileTrue: [ 
			aPP2Context shift 
		].
	
		(aPP2Context peek == $" ) 
	] whileTrue: [
		aPP2Context shift.
		aPP2Context upTo: $".
	].

	^ failure