predicates creation
digit
	^ self new
		predicate: (PP2CharSetPredicate on: [ :char | char isDigit ]);
		predicateMessage: 'digit expected';
		yourself