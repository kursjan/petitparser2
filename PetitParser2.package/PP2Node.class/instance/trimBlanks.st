operators
trimBlanks
	"Answer a new parser that consumes spaces before and after the receiving parser."
	
	^ self trim: #blank asParser2 star