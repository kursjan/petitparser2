visiting
visitToken: parser
	| start token retval |
	start := currentContext position.
	(retval := self visit: parser child) isPetit2Failure ifTrue: [ ^ retval ].

	token :=	currentContext newToken: (parser tokenClass) from: start.
	^ token