testing
testVariable7
	PPSmalltalkGrammar allowUnderscoreAssignment ifFalse: [
		self 
			parse: '__gen_var_123__'
			rule: #primary ]