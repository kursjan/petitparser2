tests
testSmalltalkNumberCompatibility
	| parser pp2Node |
	parser := PPSmalltalkGrammar new number.
	
	pp2Node := PP2CompatibilityNode on: parser.
	
	self assert: pp2Node parse: '123' to: #(#(nil $1) 123).