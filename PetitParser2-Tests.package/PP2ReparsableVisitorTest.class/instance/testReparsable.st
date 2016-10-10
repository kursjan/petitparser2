as yet unclassified
testReparsable
	reparsable := #letter asPParser star reparsable.
	parser := reparsable wrapped.
	
	self visit: parser.
	
	self assert: reparsable strategy isKindOf: PP2Reparsable 