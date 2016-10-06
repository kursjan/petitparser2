predicates
space
	^ PP2PredicateObjectNode new 
		predicate: (PP2CharSetPredicate on: [ :char | char isSeparator ]);
		predicateMessage: 'separator expected';
		negated: (PP2CharSetPredicate on: [ :char | char isSeparator not ]);
		negatedMessage: 'separator not expected';
		yourself