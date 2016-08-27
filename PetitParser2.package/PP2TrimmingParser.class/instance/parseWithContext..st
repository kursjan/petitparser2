parsing - private
parseWithContext: startContext
	| context tokenContext |
	
	context := startContext.
	[ (context := trimmer parseWithContext:  context) isPetit2Failure ] whileFalse.

	tokenContext := super parseWithContext:  (context success).
	
	context := tokenContext.
	[ (context := trimmer parseWithContext:  context) isPetit2Failure ] whileFalse.

	^ tokenContext setPosition: context position