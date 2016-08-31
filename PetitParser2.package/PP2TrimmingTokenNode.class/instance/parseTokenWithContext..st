parsing - private
parseTokenWithContext: startContext
	| context token |
	context := parser parseWithContext:  startContext.
	context isPetit2Failure ifTrue: [ ^ context ].

	token :=	context newToken: tokenClass from: startContext position.
	^ context setValue: token