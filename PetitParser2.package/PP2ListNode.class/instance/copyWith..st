copying
copyWith: aParser
	^ self species withAll: (parsers copyWith: aParser)