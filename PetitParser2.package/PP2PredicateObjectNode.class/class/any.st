predicates creation
any
	^ self new
		predicate: [ :each | true ];
		predicateMessage: 'input expected';
		negated: [ :each | false ];
		negatedMessage: 'no input expected';
		yourself
