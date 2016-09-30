accessing
add: aPP2Node to: node
	| nextSet |
	nextSet := nextSets at: node ifAbsentPut: [ IdentitySet new ].
	(nextSets at: node) add: aPP2Node