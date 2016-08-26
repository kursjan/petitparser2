grammar
temporaries
	^ ($| asParser2 smalltalkToken , variable star , $| asParser2 smalltalkToken) optional ==> [ :nodes | nodes ifNil: [ #() ] ]