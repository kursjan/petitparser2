enumerating
allParsersDo: aBlock
	"Iterate over all the parse nodes of the receiver."

	self allParsersDo: aBlock seen: IdentitySet new