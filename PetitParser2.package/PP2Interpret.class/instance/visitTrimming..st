visiting
visitTrimming: parser
	| tokenValue |
	[ (self visit: parser trimmer) isPetit2Failure ] whileFalse.
	
	self discardFailure.
	(self visit: parser child) isPetit2Failure 	ifTrue: [ ^ currentContext ].
	tokenValue := currentContext retval.
	
	[ (self visit: parser trimmer) isPetit2Failure ] whileFalse.

	^ currentContext success: tokenValue