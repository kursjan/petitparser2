enumerating
allParsers
	"Answer all the parse nodes of the receiver."

	| result |
	result := OrderedCollection new.
	self allParsersDo: [ :parser | result addLast: parser ].
	^ result