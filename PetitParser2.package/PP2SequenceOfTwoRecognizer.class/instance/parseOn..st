parsing
parseOn: context
	| retval memento |
	memento := self remember: context.
	(retval := firstChild parseOn: context) isPetit2Failure ifTrue: [ 
		^ retval
	].

	(retval := secondChild parseOn: context) isPetit2Failure ifTrue: [ 
		self restore: context from: memento.
		^ retval
	].