parsing - private
parseOn: aPP2Context

	| continuation index retval |
	
	index := Continuation currentDo: [ :cc | continuation := cc. 1 ].
	(index > children size) ifFalse: [ 
		aPP2Context continuationStack push: (continuation -> (index + 1)).
		retval := (children at: index) parseWithContext: aPP2Context.
	] ifTrue: [ 
		retval := aPP2Context failure: 'no suitable choice found'
	].

	^ retval
