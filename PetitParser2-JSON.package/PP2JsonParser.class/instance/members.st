grammar
members
	^ super members ==> [ :nodes | nodes reject: [ :each | each isToken ] ]