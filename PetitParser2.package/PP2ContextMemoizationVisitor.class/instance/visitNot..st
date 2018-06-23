visiting
visitNot: node
	node child contextChanges isNotContextChange ifTrue: [ 
		node memoizationStrategy: PP2CFMemoization new.
		^ 	super visitNot: node.
	].

	node child contextChanges isContextPop ifTrue: [ 
		node memoizationStrategy: PP2PopMemoization new.
		^ 	super visitNot: node.
	].

	node child contextChanges isContextPush ifTrue: [ 
		node memoizationStrategy: PP2PushMemoization new.
		^ 	super visitNot: node.
	].

	^ 	super visitAnd: node.
