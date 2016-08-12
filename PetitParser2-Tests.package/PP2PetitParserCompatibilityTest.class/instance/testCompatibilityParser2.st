tests
testCompatibilityParser2
	| parser pp2Node |
	parser := [ :ctx | (ctx stream peekFor: $a) ifTrue: [ $a ] ifFalse: [nil]] asParser.
	
	pp2Node := PP2CompatibilityNode on: parser.
	
	self assert: pp2Node parse: 'a' to: $a.
	self assert: pp2Node parse: 'b' to: nil end: 0.	