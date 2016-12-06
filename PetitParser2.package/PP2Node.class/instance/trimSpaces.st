operators-trimming
trimSpaces
	"Answer a new parser that consumes spaces before and after the receiving parser."
	
	^ self trim: #space asPParser star