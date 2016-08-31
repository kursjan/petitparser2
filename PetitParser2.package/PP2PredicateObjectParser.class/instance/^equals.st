comparing
= anotherNode
	self class == anotherNode class ifFalse: [ ^ false ].
	
	self predicate classification = anotherNode predicate classification ifFalse: [ ^ false ].
	self predicateMessage = anotherNode predicateMessage ifFalse: [ ^ false ].
	^ true