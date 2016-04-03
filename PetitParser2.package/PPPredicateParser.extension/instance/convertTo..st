*petitparser2
convertTo: aPP2Node
	^ (super convertTo: aPP2Node)
		predicate: predicate;
		predicateMessage: predicateMessage;
		negated: negated;
		negatedMessage: negatedMessage;
		yourself