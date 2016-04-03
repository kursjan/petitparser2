tests
testChoiceAndPriorityChoice
	| parser1 parser2 parser |
	
	parser1 := $a asParser2 // $b asParser2.
	parser2 := $c asParser2 // $d asParser2.
	parser := parser1 / parser2.
	
	self assert: parser parse: 'a'.
	self assert: parser parse: 'b'.
	self assert: parser parse: 'c'.
	self assert: parser parse: 'd'.
	self assert: parser fail: 'e'.