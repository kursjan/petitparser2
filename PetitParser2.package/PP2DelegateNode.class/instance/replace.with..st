transforming
replace: aParser with: anotherParser
	child == aParser ifTrue: [ child := anotherParser ]