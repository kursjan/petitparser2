visiting
visit: aPP2Parser
	| result |
	(self isOpened: aPP2Parser) ifTrue: [  
		self parserOpened: aPP2Parser.
	].

	(self isClosed: aPP2Parser) ifTrue: [ 
		self parserClosed: aPP2Parser.
	].

	((self isOpened: aPP2Parser) or: [self isClosed: aPP2Parser]) ifTrue: [
		self cachedResultFor: aPP2Parser
	].

	self open: aPP2Parser.
	result := aPP2Parser accept: self.
	self cacheResult: result for: aPP2Parser.
	self close: aPP2Parser.
	^ result