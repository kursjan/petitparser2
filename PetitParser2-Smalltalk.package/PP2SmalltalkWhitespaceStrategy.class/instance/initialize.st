parsing
initialize
	super initialize.
	failure := PP2Failure new 
		message: 'no whitespace found';
		yourself