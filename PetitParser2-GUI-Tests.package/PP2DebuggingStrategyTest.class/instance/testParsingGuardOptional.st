as yet unclassified
testParsingGuardOptional
	| classification debugStrategy optional |
	optional := $a asPParser optional.
	
	debugStrategy := optional strategy debug.
	classification := Array new: 255 withAll: false.
	
	self assert: (debugStrategy parsingGuard: classification) == debugStrategy.
	self assert: debugStrategy strategy isKindOf: PP2ParsingGuard.	
	self assert: debugStrategy strategy retval isNil.