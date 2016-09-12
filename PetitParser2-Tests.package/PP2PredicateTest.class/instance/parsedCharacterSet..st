utilities
parsedCharacterSet: aParser
	| result |
	result := WriteStream on: String new.
	self charactersDo: [ :char |
		(aParser matches: (char asString))
			ifTrue: [ result nextPut: char ] ].
	^ result contents