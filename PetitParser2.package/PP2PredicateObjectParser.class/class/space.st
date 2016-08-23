predicates creation
space
	^ self new 
		predicate: (PPCharSetPredicate on: [ :char | char isSeparator ]);
		predicateMessage: 'separator expected';
		yourself