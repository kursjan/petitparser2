tests
testEOFBoundary
	| sea |

	sea := self seaInstance island: $a asPParser.
	
	self assert: sea parse: '..a..'.
	self assert: self result second equals: $a.

	self assert: sea fail: '..'