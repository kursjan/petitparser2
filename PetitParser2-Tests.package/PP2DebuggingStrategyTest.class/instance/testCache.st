as yet unclassified
testCache
	| debugStrategy |
	debugStrategy := strategy debug.
	
	self assert: debugStrategy cache == debugStrategy.
	self assert: debugStrategy strategy isKindOf: PP2Cache
	