operators-trimming
trimSpacesRight
	"Answer a new parser that consumes spaces after the receiving parser."
	
	^ (self, #space asPParser star) ==> #first