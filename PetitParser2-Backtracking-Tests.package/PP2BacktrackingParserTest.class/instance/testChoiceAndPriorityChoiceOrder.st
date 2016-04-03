as yet unclassified
testChoiceAndPriorityChoiceOrder
	| parser1 parser2 parser |
	
	parser1 := $a asParser2 // $b asParser2.
	parser2 := 'b' asParser2 // $c asParser2.
	parser := parser1 / parser2.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'b' to: $b.
	self assert: parser parse: 'c' to: $c.
	self assert: parser fail: 'd'.