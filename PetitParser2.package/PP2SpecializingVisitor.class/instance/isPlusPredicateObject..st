testing
isPlusPredicateObject: node 
	^ (node min = 1) and: [ 
	  (node max = SmallInteger maxVal) and: [ 
	  node child isKindOf: PP2PredicateObjectNode 
	]]