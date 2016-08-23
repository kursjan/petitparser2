tests
testCompatibilityParser
	| parser pp2Node |
	parser := [ :ctx | ctx next ] asParser.
	
	pp2Node := PP2CompatibilityNode on: parser.
	
	self assert: pp2Node parse: 'a' to: $a.