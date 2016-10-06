predicates
any
	^ PP2PredicateObjectNode new
		predicate: [ :each | true ];
		predicateMessage: 'input expected';
		negated: [ :each | false ];
		negatedMessage: 'no input expected';
		yourself
