predicates creation
letter
	^ self new
		predicate: (PPCharSetPredicate on: [ :char | char isLetter ]);
		predicateMessage: 'letter expected';
		yourself