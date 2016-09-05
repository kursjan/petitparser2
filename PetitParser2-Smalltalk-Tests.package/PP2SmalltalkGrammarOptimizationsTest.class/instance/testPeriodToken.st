tests
testPeriodToken
	| periodToken |
	parser := PP2SmalltalkGrammar new optimize.
	periodToken := parser productionAt: #periodToken.
	
	self assert: periodToken child strategy isKindOf: PP2TrimmingLiteralObjectToken.