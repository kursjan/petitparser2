as yet unclassified
parseOn: aPP2Context
	| retval petitContext |
	petitContext := PPContext new
		stream: aPP2Context stream asPetitStream;
		position: aPP2Context position;
		yourself.

	retval := node petitParser parseOn: petitContext.
	
	^ retval isPetitFailure 
		ifTrue: [ PP2Failure message: retval message context: aPP2Context ]
		ifFalse: [ aPP2Context position: petitContext position. retval ]	