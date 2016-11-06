as yet unclassified
testSequencePushPop
	parser := $a asPParser push, #letter asPParser match, $a asPParser pop.
	
	self denyCFMemoization: parser.