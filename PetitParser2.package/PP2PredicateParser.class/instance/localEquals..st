comparing
localEquals: anotherNode
	(super localEquals: anotherNode) ifFalse: [ ^ false ].
	
	self predicate printString = anotherNode predicate printString ifFalse: [ ^ false ].
	self predicateMessage = anotherNode predicateMessage ifFalse: [ ^ false ].
	^ true