as yet unclassified
testSequencePop
	parser := $a asPParser, $b asPParser pop, $c asPParser.
	
	self assertPopMemoization: parser.