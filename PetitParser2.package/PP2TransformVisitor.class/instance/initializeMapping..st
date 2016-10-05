visiting
initializeMapping: rootNode
	| transformed |
	
	rootNode allNodesDo: [ :node |
		transformed := node copy. 
		(predicate value: node) ifTrue: [  
			transformed := block value: transformed
		].
		mapping at: node put: transformed.
	]