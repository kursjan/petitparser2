tests
testNilSeaSequence
	| sea sea2 parser |

	sea := self seaInstance island: nil asPParser.
	sea2 := self seaInstance island: nil asPParser.
	parser := sea flatten, sea2 flatten.
	
	self assert: parser parse: ''.
	self assert: self result first equals: ''.	
	self assert: self result second equals: ''.	

	self assert: parser parse: '...'.
	self assert: self result first equals: '...'.
	self assert: self result second equals: ''.	

