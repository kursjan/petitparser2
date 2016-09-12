predicates creation
letter
	^ self new
		predicate: (PP2CharSetPredicate on: [ :char | char isLetter ]);
		predicateMessage: 'letter expected';
		negated: (PP2CharSetPredicate on: [ :char | char isLetter not ]);
		negatedMessage: 'letter not expected';
		yourself