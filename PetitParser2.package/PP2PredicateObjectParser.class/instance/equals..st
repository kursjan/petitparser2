comparing
equals: anotherNode
	(super equals: anotherNode) ifFalse: [ ^ false ].
	
	self predicate classification = anotherNode predicate classification ifFalse: [ ^ false ].
	self predicateMessage = anotherNode predicateMessage ifFalse: [ ^ false ].
	^ true