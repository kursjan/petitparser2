test
testDebugResult
	| fragment |
	fragment := PP2Fragment new
		parser: $a asPParser plus;
		stream: 'baab' asPetit2Stream;
		start: 1;
		stop: 3;
		parsedValue: #foobar;
		yourself.
		
	self assert: fragment debugResult isNotNil.

	self assert: fragment debugResult children first result size equals: 2.
	self assert: fragment debugResult children first result first equals: $a.