testing
isStarPredicateObject: node 
	^ (node min = 0) and: [ 
	  (node max = SmallInteger maxVal) and: [ 
	  node child isKindOf: PP2PredicateObjectNode 
	]]