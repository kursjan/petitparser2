accessing
rows
	^ (row delimitedBy: endOfLine)  ==> [ :nodes | nodes reject: [ :each | each isToken ] ]