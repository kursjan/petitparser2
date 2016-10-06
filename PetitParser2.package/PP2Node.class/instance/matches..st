parsing
matches: anObject
	"Answer if anObject can be parsed by the receiver."
	
	^ (self parseContext: anObject) isPetit2Failure not