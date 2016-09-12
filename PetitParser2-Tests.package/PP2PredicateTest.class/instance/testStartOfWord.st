testing-chars
testStartOfWord
	| parser |
	parser := #startOfWord asParser, #word asParser plus.
	
	self assert: parser parse: 'lorem'.
	
	parser := #any asParser, #startOfWord asParser, #word asParser plus.
	self assert: parser fail: 'lorem'.
	self assert: parser fail: '1234'.
	
	self assert: parser parse: ' lorem'.	
	self assert: parser parse: ' 123'.
	self assert: parser parse: ')lorem'.
	self assert: parser parse: ':lorem'.
	
	parser := #startOfWord asParser, #any asParser optional.
	self assert: parser fail: ''.
	self assert: parser parse: 'a'.
	self assert: parser fail: '.'.