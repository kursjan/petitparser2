tests - packrat
testPackratContextSensitiveFailure
	| packrat parser result |

	packrat := #letter asPParser match memoize.
	parser := (#letter asPParser push, packrat) and, #letter asPParser, packrat.
	
	parser optimize.
	parser enableDebug.
	
	result := self assert: parser fail: 'aa' end: 1