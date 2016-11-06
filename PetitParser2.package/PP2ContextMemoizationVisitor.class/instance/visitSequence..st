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

	node contextChanges isContextPush ifTrue: [ 
		node memoizationStrategy: PP2PushMemoization new.
		^ 	super visitSequence: node
	].

	((node children anySatisfy: [ :child | child contextChanges isContextChange  ]) and: [
	  node contextChanges isNotContextChange ]) ifTrue: [ 
			"JK: PUSH-POP case, can be handled by the PushMemoization, let me know if not :)"
			node memoizationStrategy: PP2PushMemoization new.
			^ 	super visitSequence: node
	].


	^ 	super visitSequence: node

