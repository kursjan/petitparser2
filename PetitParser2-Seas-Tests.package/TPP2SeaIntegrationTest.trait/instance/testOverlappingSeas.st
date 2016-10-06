tests
testOverlappingSeas
	| seas seaOne seaTwo |

	seaOne := self seaInstance island: $a asPParser.
	seaTwo := self seaInstance island: $b asPParser.
	
	seas := seaOne, seaTwo.
	
	self assert: seas parse: '..a..b..'.
	self assert: self result first second equals: $a.
	self assert: self result second second equals: $b.
	
	self assert: seas fail: '..b..a..b..'.
	self assert: seas fail: '..a..'