visiting
visitFlatten: parser
	| start |
	start := currentContext position.
	(self visit: parser child) isPetit2Failure ifTrue: [ ^ currentContext ].

	^ currentContext copyFrom: start + 1 to: (currentContext position)