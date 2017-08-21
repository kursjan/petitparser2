comparing
localEquals: anotherNode
	(super localEquals: anotherNode) ifFalse: [ ^ false ].

	^ self tokenClass == anotherNode tokenClass