tests
testSanity
	| parser |
	parser := ((($f asPParser, 'oo' asPParser) wrapped not ==> [ :e | e ]) star / 
				   (nil asPParser, '' asPParser)) end.
	PP2FirstSetCache new doPass: parser.
	
	self assert: (parser allNodes allSatisfy: [ :child | child hasProperty: #firstSet ])