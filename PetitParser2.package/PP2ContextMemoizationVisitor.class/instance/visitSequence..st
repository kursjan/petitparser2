visiting
visitSequence: node
	(node children noneSatisfy: [:child | child contextChanges isContextChange ]) ifTrue: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	^ 	super visitSequence: node
