as yet unclassified
testReparsable
	| debugStrategy |
	debugStrategy := strategy debug.
	
	self assert: debugStrategy reparsable == debugStrategy.
	self assert: debugStrategy strategy isKindOf: PP2Reparsable
	