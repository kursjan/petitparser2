tests
testChoiceAndPriorityChoiceOrder
	| parser1 parser2 parser |
	
	parser1 := $a asPParser // $b asPParser.
	parser2 := 'b' asPParser // $c asPParser.
	parser := parser1 / parser2.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'b' to: $b.
	self assert: parser parse: 'c' to: $c.
	self assert: parser fail: 'd'.