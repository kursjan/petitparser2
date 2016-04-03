visiting
visitToken: parser
	| start token |
	start := currentContext position.
	(self visit: parser child) isPetit2Failure ifTrue: [ ^ currentContext ].

	self flag: 'Potential to otpimization! Perhaps add a method PP2Stream>>tokenFrom:to:'.
	"
		if we do not copy, but just remember start and stop.
		On the other hand, if we want to support streams --- real ones, not the ones
		that are completely in memory, we need to copy tokens.
	"
	token :=	(parser tokenClass new)
		collection: (currentContext stream copyFrom: start to: currentContext position - 1);
		start: 1;
		stop: currentContext position - start;
		yourself.
		
	^ currentContext success: token