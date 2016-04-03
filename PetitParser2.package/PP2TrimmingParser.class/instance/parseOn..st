as yet unclassified
parseOn: startContext
	| context tokenContext |
	
	context := startContext.
	[ (context := trimmer parseOn:  context) isPetit2Failure ] whileFalse.

	tokenContext := super parseOn:  (context success).
	
	context := tokenContext.
	[ (context := trimmer parseOn:  context) isPetit2Failure ] whileFalse.

	^ tokenContext setPosition: context position