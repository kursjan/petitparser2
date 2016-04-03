as yet unclassified
testStreamBacktrack
	parser := 'aa' asParser2, 'a' asParser2 / 'aa' asParser2.
	stream := MinimalStream on: 'aa'.
	
	self assert: (parser parse: stream) isPetit2Success.		
	