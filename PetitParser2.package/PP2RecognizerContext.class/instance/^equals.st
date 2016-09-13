comparing
= anotherContext
	super = anotherContext ifFalse: [ ^ false ]	.

	(self inToken == anotherContext inToken) ifFalse: [ ^ false ].
	(self parent == anotherContext parent) ifFalse: [ ^ false ].
	
	^ true