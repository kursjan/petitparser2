visiting
visitFlatten: parser
	| start result |
	start := currentContext position.
	(result := self visit: parser child) isPetit2Failure ifTrue: [ ^ result ].

	^ currentContext copyFrom: start + 1 to: (currentContext position)