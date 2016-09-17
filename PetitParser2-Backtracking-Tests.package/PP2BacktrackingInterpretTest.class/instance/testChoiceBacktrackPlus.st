tests
testChoiceBacktrackPlus
	| parser |
	parser := ((#letter asPParser // $a asPParser) plus, 'bbb' asPParser) end.
	
	self assert: parser parse: 'abbb' to: (OrderedCollection with: (OrderedCollection with: $a) with: 'bbb').