test - result contract
testResultContextFailure
	| parser result |
	parser := $a asParser2, $b asParser2.
	result := parser parseDirectly: 'ac'.
	
	self assert: (result isKindOf: PP2ImmutableContext).
	self assert: result startContext isNotNil.
	self assert: result startContext position = 0.
	self assert: result startContext parser == parser.
