grammar
temporaries
	^ ($| asPParser smalltalkToken , variable star , $| asPParser smalltalkToken) optional ==> [ :nodes | nodes ifNil: [ #() ] ]