tests
testChoiceBacktrackPlus
	| parser |
	parser := ((#letter asParser2 // $a asParser2) plus, 'bbb' asParser2) end.
	
	self assert: parser parse: 'abbb' to: #( #($a) 'bbb').