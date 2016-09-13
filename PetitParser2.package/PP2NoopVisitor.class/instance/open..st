visiting - utilities
open: context
	self assert: (self isOpened: context) not.
	openSet add: context.
	openStack push: context