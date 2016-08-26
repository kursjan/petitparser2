visiting
visitToken: parser
	| start token |
	start := currentContext position.
	(self visit: parser child) isPetit2Failure ifTrue: [ ^ currentContext ].

	token :=	currentContext newToken: (parser tokenClass) from: start.
"		
		collection: (currentContext stream copyFrom: start to: currentContext position - 1);
		start: 1;
		stop: currentContext position - start;
		yourself.
"		
	^ currentContext success: token