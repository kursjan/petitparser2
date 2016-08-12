parsing
parseOn: startContext
	| context token |
	context := parser parseWithContext:  startContext.
	context isPetit2Failure ifTrue: [ ^ context ].

	token :=	context newToken: tokenClass from: startContext position.
"		
		collection: (context copyFrom: (startContext position) to: context position - 1) value;
		start: 1;
		stop: context position - startContext position;
		yourself.
"		
	^ context setValue: token