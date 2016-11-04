tests - packrat
testPackratContextSensitive
	| packrat parser result |

	packrat := #letter asPParser match memoize.
	parser := (#letter asPParser push, packrat) and, #letter asPParser push, packrat.
	
	parser optimize.
	parser enableDebug.
	
	result := self assert: parser parse: 'aa'.
	self assert: result debugResult steps equals: 11