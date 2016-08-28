parsing - private
parseWithContext: startContext
	| context tokenContext |
	
	context := startContext.
	[ (context := trimmer parseWithContext: context) isPetit2Failure ] whileFalse.

	(tokenContext := super parseWithContext: (context success)) isPetit2Failure ifTrue: [ ^ tokenContext ].
	
	context := tokenContext.
	[ (context := trimmer parseWithContext: context) isPetit2Failure ] whileFalse.

	^ tokenContext setPosition: context position