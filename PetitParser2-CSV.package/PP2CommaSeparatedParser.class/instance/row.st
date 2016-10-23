accessing
row
	^ (cell delimitedBy: $, asPParser token) ==> [ :nodes | nodes reject: [ :each | each isToken ] ]