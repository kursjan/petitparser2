tests - context interface
testNewTokenFromTo
	| stream |
	stream := self streamOn: 'foo'. 
	
	self assert: (stream newToken: PP2Token from: 1 to: 3) value equals: 'foo'.