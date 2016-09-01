comparing
localEquals: anotherNode
	(super localEquals: anotherNode) ifFalse: [ ^ false ].
	
	self literal = anotherNode literal ifFalse: [ ^ false ].
	self message = anotherNode message ifFalse: [ ^ false ].
	
	^ true