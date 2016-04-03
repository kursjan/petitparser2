visiting
visitLiteralSequence: parser
	| context |
	context := currentContext next: parser size.
	parser literal = context value ifTrue: [ ^ context ].
	^ currentContext failure: message