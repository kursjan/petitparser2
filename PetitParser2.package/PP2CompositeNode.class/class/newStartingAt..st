instance creation
newStartingAt: aSymbol
	"Answer a new parser starting at aSymbol. The code makes sure to resolve all dependent parsers correctly."

	| parsers remaining |
	parsers := IdentityDictionary new.
	remaining := OrderedCollection with: self.
	[ remaining isEmpty ] whileFalse: [
		| dependency |
		dependency := remaining removeLast.
		(parsers includesKey: dependency) ifFalse: [
			parsers at: dependency put: dependency basicNew.
			remaining addAll: dependency dependencies ] ].
	parsers keysAndValuesDo: [ :class :parser |
		| dependencies |
		dependencies := IdentityDictionary new.
		class dependencies 
			do: [ :dependency | dependencies at: dependency put: (parsers at: dependency) ].
		parser 
			initializeStartingAt: (class == self
				ifTrue: [ aSymbol ]
				ifFalse: [ class startSymbol ]) 
			dependencies: dependencies ].
	parsers keysAndValuesDo: [ :class :parser |
		parser parser: (parser perform: parser children first name).
		parser productionNames keysAndValuesDo: [ :key :value |
			(parser instVarAt: key) parser: (parser perform: value) ] ].
	
	^ parsers at: self