testing
testMethod2
	"Spaces at the beginning of the method."
	self 
		parse: '	  negated ^ 0 - self'
		rule: #method