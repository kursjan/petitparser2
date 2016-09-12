testing-chars
testEndOfLine
	| cr crlf lf parser |
	cr := Character cr asString.
	crlf := Character cr asString , Character lf asString.
	lf := Character lf asString.
	parser := (#letter asParser / #blank asParser) star, #endOfLine asParser.
	
	self assert: parser parse: 'lorem ipsum'.
	
	parser := #any asParser, #endOfLine asParser, #any asParser star.
	self assert: parser parse: 'a', cr, 'b'.
	self assert: parser fail: crlf.
	self assert: parser fail: 'lorem ipsum'.
	
	parser := #endOfLine asParser, #any asParser, #endOfLine asParser negate star, #endOfLine asParser.
	self assert: parser parse: cr, 'lorem ipsum'.
	self assert: parser parse: lf, 'lorem ipsum'.	
	self assert: parser parse: crlf, 'lorem ipsum'.	
	
	self assert: parser parse: crlf.
	self assert: parser parse: cr.
	self assert: parser parse: lf.
	
	parser := #endOfLine asParser negate star, #endOfLine asParser, #any asParser star.
	self assert: parser parse: crlf, 'lorem ipsum'.
	self assert: parser parse: crlf.
