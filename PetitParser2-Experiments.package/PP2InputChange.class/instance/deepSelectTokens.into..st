enumerating
deepSelectTokens: node into: aSet
	node isToken ifTrue: [ aSet add: node ].
	
	node nodesDo: [ :child | self deepSelectTokens: child into: aSet	]
	