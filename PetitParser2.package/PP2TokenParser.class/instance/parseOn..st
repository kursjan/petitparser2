parsing
parseOn: startContext
	| context token |
	context := parser parseWithContext:  startContext.
	context isPetit2Failure ifTrue: [ ^ context ].

	self flag: 'Potential to otpimization! Perhaps add a method PP2Stream>>tokenFrom:to:'.
	"
		if we do not copy, but just remember start and stop.
		On the other hand, if we want to support streams --- real ones, not the ones
		that are completely in memory, we need to copy tokens.
	"
	token :=	tokenClass new
		collection: (context copyFrom: (startContext position) to: context position - 1) value;
		start: 1;
		stop: context position - startContext position;
		yourself.
		
	^ context setValue: token