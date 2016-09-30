accessing
addAll: aCollection to: node
	| nextSet |
	nextSet := nextSets at: node ifAbsentPut: [ IdentitySet new ].
	(nextSets at: node) addAll: aCollection