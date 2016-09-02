visiting
visit: aPP2Node
	| result |
	(self isOpened: aPP2Node) ifTrue: [  
		self nodeOpened: aPP2Node.
	].

	(self isClosed: aPP2Node) ifTrue: [ 
		self nodeClosed: aPP2Node.
	].

	(self isOpened: aPP2Node) ifTrue: [
		^ self openedResultFor: aPP2Node
	].

	((self isClosed: aPP2Node) and: [ self shouldRevisit not]) ifTrue: [
		^ self cachedResultFor: aPP2Node
	].

	self open: aPP2Node.
	self beforeAccept: aPP2Node.
	result := aPP2Node accept: self.
	self afterAccept: aPP2Node result: result.
	self cacheResult: result for: aPP2Node.
	self close: aPP2Node.
	^ result