testing-chars
testEndOfFile
	| parser |
	parser := (#letter asParser / #blank asParser) star, #eof asParser.
	
	self assert: parser parse: 'lorem ipsum'.
	
	parser := #any asParser, #eof asParser, #any asParser star.
	self assert: parser fail: 'a', Character cr asString, 'b'.
	self assert: parser fail: Character cr asString , Character lf asString.
	self assert: parser parse: 'a'.
