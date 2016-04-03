predicates creation
digit
	^ self new
		predicate: (PPCharSetPredicate on: [ :char | char isDigit ]);
		predicateMessage: 'digit expected';
		yourself