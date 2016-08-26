testing-literals
testSymbolLiteral6
	PPSmalltalkGrammar allowUnderscoreAssignment ifFalse: [
		self 
			parse: '#__gen__binding'
			rule: #symbolLiteral ]