copying
copyWith: aParser
	^ self species withAll: (children copyWith: aParser)