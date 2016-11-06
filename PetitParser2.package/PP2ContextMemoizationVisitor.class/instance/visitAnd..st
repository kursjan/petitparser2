visiting
visitAnd: node
	node child contextChanges isNotContextChange ifTrue: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	node child contextChanges isContextPop ifTrue: [ 
		node memoizationStrategy: PP2PopMemoization new
	].

	^ 	super visitAnd: node.
