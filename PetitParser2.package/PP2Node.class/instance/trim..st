operators
trim: aParser
	"Answer a new parser that consumes and ignores aParser repeatedly before and after the receiving parser."
	
	^ (PP2TrimmingParser on: self)
		trimmer: aParser;
		yourself