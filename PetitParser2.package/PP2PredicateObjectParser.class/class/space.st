predicates creation
space
	^ self new 
		predicate: (PP2CharSetPredicate on: [ :char | char isSeparator ]);
		predicateMessage: 'separator expected';
		yourself