testing
testMethod3
	"Spaces at the end of the method."
	self 
		parse: '	negated ^ 0 - self  '
		rule: #method