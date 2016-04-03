visiting
visitPetitParser: aPPParser
	| retval petitContext |
	petitContext := PPContext new
		stream: currentContext stream;
		position: currentContext position;
		yourself.
	retval := aPPParser parseOn: petitContext.
	
	retval isPetitFailure 
		ifTrue: [ currentContext failure: retval message ]
		ifFalse: [ currentContext success: retval; position: petitContext position ]