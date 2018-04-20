visiting
visitChoice: parser
	| retval |
	
	1 to: parser children size do: [ :index |
		(retval := self visit: (parser childAt: index)) isPetit2Success ifTrue: [ ^ retval ] 
	].
	
	^ retval