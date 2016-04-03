visiting
visitTrimmingToken: parser
	| tokenValue |
	[ (self visit: parser trimmer) isPetit2Failure ] whileFalse.
	
	self discardFailure.
	(currentContext := self visitToken: parser) isPetit2Failure ifTrue: [ ^ currentContext ].
	tokenValue := currentContext retval.
	
	[ (self visit: parser trimmer) isPetit2Failure ] whileFalse.

	^ currentContext success: tokenValue