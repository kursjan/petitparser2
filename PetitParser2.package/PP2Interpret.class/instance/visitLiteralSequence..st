visiting
visitLiteralSequence: parser
	| memento retval |
	memento := currentContext remember.
	retval := currentContext next: parser size.
	parser literal = retval ifTrue: [ ^ retval ].

	currentContext restore: memento.
	^ PP2Failure message: parser message context: currentContext