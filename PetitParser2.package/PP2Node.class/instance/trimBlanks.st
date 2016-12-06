operators-trimming
trimBlanks
	"Answer a new parser that consumes spaces before and after the receiving parser."
	
	^ self trim: #blank asPParser star