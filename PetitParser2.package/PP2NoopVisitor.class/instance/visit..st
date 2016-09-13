visiting
visit: node
	| result context |
	context := self context: node.
	
	(self isClosed: context) ifTrue: [ 
		self nodeClosed: node.
		^ self cachedResultFor: context
	].

	(self isOpened: context) ifTrue: [
		self nodeOpened: node.
		^ self openedResultFor: context
	].

	self open: context.
	self beforeAccept: context.
	result := node accept: self.
	self afterAccept: context result: result.
	self cacheResult: result for: context.
	self close: context.

	^ result