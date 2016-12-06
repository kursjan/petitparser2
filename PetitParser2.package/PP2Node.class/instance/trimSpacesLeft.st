operators-trimming
trimSpacesLeft
	"Answer a new parser that consumes spaces before the receiving parser."
	
	^ (#space asPParser star, self) ==> #second