comparing
= anotherContext
	self class == anotherContext class ifFalse: [ ^ false ].

	^ self node == anotherContext node