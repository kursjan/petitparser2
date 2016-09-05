comparing
localEquals: anotherNode
	(super localEquals: anotherNode) ifFalse: [ ^ false ].
	
	^ self size = anotherNode size