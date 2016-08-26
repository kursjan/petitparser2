*PetitParser2-Compatibility
visitPetitParser: aPPParser
	| retval petitContext |
	petitContext := PPContext new
		stream: currentContext stream asPetitStream;
		position: currentContext position;
		yourself.

	retval := aPPParser parseOn: petitContext.
	
	^ retval isPetitFailure 
		ifTrue: [ PP2Failure message: retval message context: currentContext ]
		ifFalse: [ currentContext position: petitContext position. retval ]