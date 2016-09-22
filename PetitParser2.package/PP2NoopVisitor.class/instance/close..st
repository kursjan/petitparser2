visiting - utilities
close: context
	self assert: (self isOpened: context).
	self assert: (self isClosed: context) not.
	self assert: (openStack top == context).
	
	openSet remove: context.
	openStack pop.
	closeSet add: context.