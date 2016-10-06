predicates
blank
	| collection |
	collection := OrderedCollection with: Character space with: Character tab.
	^ PP2PredicateObjectNode new 
		predicate: (PP2CharSetPredicate on: [ :char | collection includes: char ]);
		predicateMessage: 'blank expected';
		negated: (PP2CharSetPredicate on: [:char | (collection includes: char) not ]);
		negatedMessage: 'blank not expected';
		yourself