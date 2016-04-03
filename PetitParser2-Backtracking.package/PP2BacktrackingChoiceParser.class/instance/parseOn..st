as yet unclassified
parseOn: aPP2Context

	| continuation index retval |
	
	index := Continuation currentDo: [ :cc | continuation := cc. 1 ].
	(index > parsers size) ifFalse: [ 
		aPP2Context continuationStack push: (continuation -> (index + 1)).
		retval := (parsers at: index) parseWithContext: aPP2Context.
	] ifTrue: [ 
		retval := aPP2Context failure: 'no suitable choice found'
	].

	^ retval
