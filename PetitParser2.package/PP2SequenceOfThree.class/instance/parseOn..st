parsing
parseOn: context
	| retval elements memento |
	memento := self remember: context.
	(retval := firstChild parseOn: context) isPetit2Failure ifTrue: [ 
		^ retval
	].
	elements := Array new: 3.
	elements at: 1 put: retval.
	
	(retval := secondChild parseOn: context) isPetit2Failure ifTrue: [ 
		self restore: context from: memento.
		^ retval
	].
	elements at: 2 put: retval.

	(retval := thirdChild parseOn: context) isPetit2Failure ifTrue: [ 
		self restore: context from: memento.
		^ retval
	].
	elements at: 3 put: retval.
	
	^ elements