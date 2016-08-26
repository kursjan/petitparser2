as yet unclassified
parseOn: startContext
	| context tokenContext |
	
	context := startContext.
	[ (context := trimmer parseOn:  context) isPetit2Failure ] whileFalse.

	(tokenContext := super parseOn:  (context success)) isPetit2Failure ifTrue: [ ^ tokenContext ].
	
	context := tokenContext.
	[ (context := trimmer parseOn:  context) isPetit2Failure ] whileFalse.

	^ tokenContext setPosition: context position