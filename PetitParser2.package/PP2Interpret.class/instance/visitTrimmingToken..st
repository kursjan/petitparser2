visiting
visitTrimmingToken: parser
	| memento retval |
	memento := currentContext remember.
	self visit: parser trimmer.
	
	(retval := self visitToken: parser) isPetit2Failure ifTrue: [ 
		currentContext restore: memento.
		^ retval
	].
	
	self visit: parser trimmer.

	^ retval