support
guardOf: classification makesSenseFor: node
	| size allNodesSize |
	allNodesSize := node propertyAt: #allNodesSize ifAbsentPut: [ node allNodes size ].
	
	"if there are too little children, the overhead of a guard is too high"
	(allNodesSize < 4) ifTrue: [ ^ false ].

	size := ((1 to: 255) 	collect: [ :index | classification at: index ]
							  	thenSelect: [ :e | e ]) size.

	"if guard passes for so many characters, it is probably(!!!) better not to guard"
	(size > 250) ifTrue: [ ^ false ].
								
	"for small parsers"
	(allNodesSize < 20 and: [size > 128 ]) ifTrue: [ ^ false ].
	
	
	"It is already guarded"
	(self isWellGuarded: classification) ifTrue: [ ^ false ].
	
	^ true