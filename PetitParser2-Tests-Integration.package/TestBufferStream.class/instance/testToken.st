tests
testToken
	parser := 'aa' asParser2 token.
	stream := PP2BufferStream on: (MinimalStream on: 'aa').
	
	self assert: (result := (parser parse: stream)) isPetit2Success.
	self assert: (result value isKindOf: PP2Token).
	self assert: result value start equals: 1.
	self assert: result value stop equals: 2.
	self assert: result value value equals: 'aa'.