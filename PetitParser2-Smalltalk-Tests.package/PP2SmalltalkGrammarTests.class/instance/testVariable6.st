testing
testVariable6
	PPSmalltalkGrammar allowUnderscoreAssignment ifFalse: [
		self 
			parse: 'super_nanny'
			rule: #primary ]