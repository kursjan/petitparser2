seas optimizations
seaCanBeRemoved: firstSet ifTrue: oneArgBlock ifFalse: aBlock
	"Single sea"
	(( firstSet size = 1) and: [ 
		firstSet anyOne isSea 
	]) ifTrue: [ ^ oneArgBlock value: firstSet anyOne ].
	
	"sea / epsilon"
	(((firstSet size = 2) and: [ 
		firstSet contains: [ :n | n isSea ] ]) and: [ 
		firstSet contains: [ :n | n isEpsilon 
	]]) ifTrue: [ ^ oneArgBlock value: (firstSet detect: [ :n | n isSea ]) ].

	"sea / #eoi"
	(((firstSet size = 2) and: [ 
		firstSet contains: [ :n | n isSea ] ]) and: [ 
		firstSet contains: [ :n | n isEOI
	]]) ifTrue: [ ^ oneArgBlock value: (firstSet detect: [ :n | n isSea ]) ].

	
	^ aBlock value

