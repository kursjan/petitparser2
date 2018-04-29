visiting
sequenceResult: node
	| pushes matches pushIndex matchIndices childrenResult |
	childrenResult := node children collect: [ :child | child -> (self  visit: child) ].
	
	pushes := node children select: [ :child | child contextChanges isContextPush ].
	matches := childrenResult select: [ :assoc | assoc value ] thenCollect: #key.
	
	matches isEmpty ifTrue: [ ^ false ].
	pushes isEmpty ifTrue: [ ^ true ].
	"probably can better here"
	pushes size > 1 ifTrue: [ ^ true ].

	"	
		JK: The idea here is, if there is a match after push, the result of the whole sequence 
		does not depend on the stacks, because the match will be compared to the value from push.
		
		E.g.  
		self assert: (#letter asPParser push, #letter asPParser match) isContextFree
	"	
	matchIndices := matches collect: [ :match | node children indexOf: match ].
	pushIndex := node children indexOf: pushes anyOne.
	
	^ matchIndices anySatisfy: [ :i | i < pushIndex ].

