as yet unclassified
testParsingGuard
	| classification debugStrategy |
	debugStrategy := strategy debug.
	classification := Array new: 255 withAll: false.
	
	self assert: (debugStrategy parsingGuard: classification) == debugStrategy.
	self assert: debugStrategy strategy isKindOf: PP2ParsingGuard.	
	self assert: debugStrategy strategy retval isPetit2Failure.