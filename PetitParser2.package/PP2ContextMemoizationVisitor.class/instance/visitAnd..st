visiting
visitAnd: node
	node child contextChanges isNotContextChange ifTrue: [ 
		node memoizationStrategy: PP2CFMemoization new.
		^ 	super visitAnd: node.
	].

	node child contextChanges isContextPop ifTrue: [ 
		node memoizationStrategy: PP2PopMemoization new.
		^ 	super visitAnd: node.
	].

	node child contextChanges isContextPush ifTrue: [ 
		node memoizationStrategy: PP2PushMemoization new.
		^ 	super visitAnd: node.
	].

	^ 	super visitAnd: node.
