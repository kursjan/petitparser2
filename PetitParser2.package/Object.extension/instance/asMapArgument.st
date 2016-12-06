*PetitParser2
asMapArgument
	"JK: Hack alert. OrderedCollection is returned from the repeating parsers.
		Array is returned from the sequence parser.
		
		As an argument into the mapping parser, ordered collection is transformed into an array
		with that collection. Array is passed unmodified.
	"
	^ Array with: self