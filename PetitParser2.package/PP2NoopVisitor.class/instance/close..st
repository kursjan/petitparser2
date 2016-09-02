visiting - utilities
close: aPP2Parser
	self assert: (self isOpened: aPP2Parser).
	self assert: (self shouldRevisit or: [(self isClosed: aPP2Parser) not]).
	
	openSet remove: aPP2Parser.
	closeSet add: aPP2Parser.