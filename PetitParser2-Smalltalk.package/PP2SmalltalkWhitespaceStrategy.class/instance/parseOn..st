parsing
parseOn: aPP2Context
	( aPP2Context atEnd not and: [ aPP2Context uncheckedPeek isSeparator ]) ifTrue: [ 
		^ aPP2Context next 
	].
		
	(aPP2Context atEnd not and: [ aPP2Context uncheckedPeek = $" ]) ifTrue: [
		aPP2Context next.
		^ aPP2Context upTo: $".
	].

	^ PP2Failure message: 'no whitespace or comment found' context: aPP2Context