testing
isAny: node
	(node isKindOf: PP2PredicateNode) ifFalse: [ ^ false ].
	
	(node predicate classification allSatisfy: [ :e | e ]) ifFalse: [ ^ false ].
	
	self assert: node predicateMessage = 'input expected'.
	^ true