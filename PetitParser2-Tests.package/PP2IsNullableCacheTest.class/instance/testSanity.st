tests
testSanity
	| parser |
	parser := ((($f asPParser, 'oo' asPParser) wrapped not ==> [ :e | e ]) star / 
				   (nil asPParser, '' asPParser)) end.
	PP2IsNullableCache new doPass: parser.
	
	self assert: (parser allNodes allSatisfy: [ :child | child hasProperty: #isNullable ])