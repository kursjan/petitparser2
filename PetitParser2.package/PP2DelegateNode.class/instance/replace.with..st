transforming
replace: aParser with: anotherParser
	parser == aParser ifTrue: [ parser := anotherParser ]