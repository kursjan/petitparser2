as yet unclassified
parseOn: startContext
	| retval petitContext |
	petitContext := PPContext new
		stream: startContext stream asPetitStream;
		position: startContext position;
		yourself.

	retval := petitParser parseOn: petitContext.
	
	^ retval isPetitFailure 
		ifTrue: [ startContext failure: retval message ]
		ifFalse: [ (startContext success: retval) position: petitContext position ]