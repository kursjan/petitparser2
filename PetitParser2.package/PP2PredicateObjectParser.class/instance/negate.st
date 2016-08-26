operators
negate
	"Answer a parser that is the negation of the receiving predicate parser."
	
	^ (self class new)
		predicate: negated;
		predicateMessage: negatedMessage;
		negated: predicate;
		negatedMessage: predicateMessage