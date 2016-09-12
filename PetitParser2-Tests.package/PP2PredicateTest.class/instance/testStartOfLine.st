testing-chars
testStartOfLine
	| cr crlf lf parser |
	cr := Character cr asString.
	crlf := Character cr asString , Character lf asString.
	lf := Character lf asString.
	parser := #startOfLine asParser, #any asParser star.
	
	self assert: parser parse: 'lorem ipsum'.
	
	parser := #any asParser, #startOfLine asParser, #any asParser star.
	self assert: parser fail: 'lorem ipsum'.
	
	parser := #startOfLine asParser, #any asParser, #startOfLine asParser, #any asParser star.
	self assert: parser parse: cr, 'lorem ipsum'.
	self assert: parser parse: lf, 'lorem ipsum'.	
	self assert: parser fail: crlf, 'lorem ipsum'.	
	
	self assert: parser fail: crlf.
	self assert: parser parse: cr.
	self assert: parser parse: lf.
	
	parser := #startOfLine asParser, #any asParser, #any asParser, #startOfLine asParser, #any asParser star.
	self assert: parser parse: crlf, 'lorem ipsum'.
	self assert: parser parse: crlf.

