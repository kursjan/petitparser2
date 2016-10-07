tests
testSeaStar
	| sea parser |

	sea := self seaInstance island: $a asPParser.
	parser := sea star.
	
	self assert: parser parse: '..a..a..a...'.
	self assert: self result size equals: 3.	

	self assert: parser parse: ''.
	self assert: self result size equals: 0.	
