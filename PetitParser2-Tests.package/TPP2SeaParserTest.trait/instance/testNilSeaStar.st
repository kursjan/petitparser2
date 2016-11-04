tests
testNilSeaStar
	| sea parser |

	sea := self seaInstance island: #epsilon asPParser.
	parser := sea flatten nonEpsilon star.
	
	self assert: parser parse: ''.
	self assert: self result isEmpty.

	self assert: parser parse: '...'.
	self assert: self result size equals: 1.
	self assert: self result first equals: '...'.

