predicates creation
letter
	^ self new
		predicate: (PP2CharSetPredicate on: [ :char | char isLetter ]);
		predicateMessage: 'letter expected';
		yourself