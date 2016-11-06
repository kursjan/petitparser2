memoization
restore: context from: memento
	context restorePosition: memento position.
	context defaultStack size < memento stackSize ifTrue: [ 	
		context defaultStack push: memento stackTop.
	]