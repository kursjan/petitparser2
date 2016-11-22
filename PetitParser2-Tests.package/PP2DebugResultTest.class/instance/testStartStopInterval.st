tests
testStartStopInterval
	| result |
	result := PP2DebugResult new.
	
	self assert: result startStopInterval isNotNil.