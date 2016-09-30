*PetitParser2-Seas-Tests
testNonEpsilon
	|  parser |
	parser := $a asPParser optional nonEpsilon.
	
	self assert: parser fail: ''.
	self assert: parser parse: 'a'