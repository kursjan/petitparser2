private
testBlock: retval into: returnNode
	| source |
	retval third isNil ifTrue: [ returnNode testBlock: [ :arg | true ]. ^ self ].
	
	"
		TODO JK: this does not seem to be correct. Check the beToken implementation in SmaCCPatternToken
			and implement beToken properly.
	"
	(retval third second = 'beToken') ifTrue: [ returnNode testBlock: [ :arg | arg isToken ]. ^ self ].

	source := 'self ' , retval third second.
	Compiler evaluate: source for: returnNode logged: false.