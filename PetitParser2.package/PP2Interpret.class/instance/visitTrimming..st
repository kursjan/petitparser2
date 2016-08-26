visiting
visitTrimming: parser
	| memento retval |
	memento := currentContext remember.
	[ (self visit: parser trimmer) isPetit2Failure ] whileFalse.
	
	(retval := self visit: parser child) isPetit2Failure ifTrue: [ 
		currentContext restore: memento.
		^ retval
	].
	
	[ (self visit: parser trimmer) isPetit2Failure ] whileFalse.

	^ retval