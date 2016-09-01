comparing
equals: anotherNode
	(super equals: anotherNode) ifFalse: [ ^ false ].
	
	self min = anotherNode min ifFalse: [ ^ false ].
	self max = anotherNode max ifFalse: [ ^ false ].
	^ true