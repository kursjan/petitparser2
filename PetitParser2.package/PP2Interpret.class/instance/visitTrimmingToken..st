visiting
visitTrimmingToken: parser
	| tokenValue |
	[ (self visit: parser trimmer) isPetit2Success ] whileTrue.
	
	self discardFailure.
	(currentContext := self visitToken: parser) isPetit2Failure ifTrue: [ ^ currentContext ].
	tokenValue := currentContext retval.
	
	[ (self visit: parser trimmer) isPetit2Success ] whileTrue.

	^ currentContext success: tokenValue