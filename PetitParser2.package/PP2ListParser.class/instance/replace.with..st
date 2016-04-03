transformation
replace: aParser with: anotherParser
	parsers keysAndValuesDo: [ :index :parser |
		parser == aParser
			ifTrue: [ parsers at: index put: anotherParser ] ]