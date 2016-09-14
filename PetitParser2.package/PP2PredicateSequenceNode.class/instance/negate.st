operators
negate
	"Answer a parser that is the negation of the receiving predicate parser."
	
	^ super negate
		size: size;
		yourself