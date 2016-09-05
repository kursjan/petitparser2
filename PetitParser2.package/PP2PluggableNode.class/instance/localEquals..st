comparing
localEquals: anotherNode
	(super localEquals: anotherNode) ifFalse: [ ^ false ].
	
	^ (self block printString = anotherNode block printString)