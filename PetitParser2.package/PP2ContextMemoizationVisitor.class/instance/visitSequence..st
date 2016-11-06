visiting
visitSequence: node
	(node children noneSatisfy: [:child | child contextChanges isContextChange ]) ifTrue: [ 
		node memoizationStrategy: PP2CFMemoization new.
		^ 	super visitSequence: node
	].

	node contextChanges isContextPop ifTrue: [ 
		node memoizationStrategy: PP2PopMemoization new.
		^ 	super visitSequence: node
	].

	^ 	super visitSequence: node

