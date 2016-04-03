test - result contract
testResultContextSuccess
	| parser result |
	parser := $a asParser2, $b asParser2.
	result := parser parse: 'ab'.
	
	self assert: (result isKindOf: PP2Context).
	self assert: result startContext isNotNil.
	self assert: result startContext position = 0.
	self assert: result startContext parser == parser.
