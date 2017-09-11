private
testBlock: retval
	retval third isNil ifTrue: [ ^ [ :arg | true ] ].
	
	(retval third second = 'beToken') ifTrue: [ ^ [ :arg | arg isToken ] ].
	self error: 'unrecognized test'