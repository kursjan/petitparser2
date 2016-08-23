predicates creation
word
	^ self new
		predicate: (PP2CharSetPredicate on: [ :char | char isAlphaNumeric ]);
		predicateMessage: 'letter or digit expected';
		yourself