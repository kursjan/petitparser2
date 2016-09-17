operators
negate
	"Answer a new parser consumes any input token but the receiver."
	
	^ self not , #any asPParser ==> #second