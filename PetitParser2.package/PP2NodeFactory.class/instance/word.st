predicates
word
	^ PP2PredicateObjectNode new
		predicate: (PP2CharSetPredicate on: [ :char | char isAlphaNumeric ]);
		predicateMessage: 'letter or digit expected';
		negated: (PP2CharSetPredicate on: [ :char | char isAlphaNumeric not ]);
		negatedMessage: 'letter or digit not expected';
		yourself