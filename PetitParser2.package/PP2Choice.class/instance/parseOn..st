parsing
parseOn: aPP2Context
	| retval |
	
	1 to: node children size do: [ :index |
		(retval := (node childAt: index) parseOn: aPP2Context) isPetit2Success ifTrue: [ ^ retval ] 
	].
	
	^ retval