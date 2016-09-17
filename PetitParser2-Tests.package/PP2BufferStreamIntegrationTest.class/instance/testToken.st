tests
testToken
	parser := 'aa' asPParser token.
	stream := self streamOn: 'aa'.
	
	self assert: parser parse: stream toTokenValue: 'aa' end: 2