predicates creation
digit
	^ self new
		predicate: (PP2CharSetPredicate on: [ :char | char isDigit ]);
		predicateMessage: 'digit expected';
		negated: (PP2CharSetPredicate on: [ :char | char isDigit not ]);
		negatedMessage: 'digit not expected';
		yourself