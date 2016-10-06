predicates
hex
	| hexBlock |
	hexBlock := [ :char | (char between: $0 and: $9) 
					or: [ (char between: $a and: $f) 
					or: [ (char between: $A and: $F) ] ]  ].
		
	^ PP2PredicateObjectNode new
		predicate: (PP2CharSetPredicate on: hexBlock);
		predicateMessage: 'hex digit expected';
		negated: (PP2CharSetPredicate on: [:char | (hexBlock value: char) not]);
		negatedMessage: 'hex digit not expected';
		yourself