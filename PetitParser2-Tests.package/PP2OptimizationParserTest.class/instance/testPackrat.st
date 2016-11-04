tests - packrat
testPackrat
	| packrat parser result |

	packrat := $a asPParser trim memoize.
	parser := packrat and, packrat.
	
	parser optimize.
	parser enableDebug.
	
	result := self assert: parser parse: ' a'.
	self assert: result debugResult steps equals: 8.