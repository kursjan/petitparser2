tests
testToken
	parser := 'aa' asParser2 token.
	stream := self streamOn: 'aa'.
	
	self assert: parser parse: stream toTokenValue: 'aa' end: 2