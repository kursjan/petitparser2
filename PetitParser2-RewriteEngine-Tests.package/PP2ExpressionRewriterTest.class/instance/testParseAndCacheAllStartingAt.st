testing - rewrite
testParseAndCacheAllStartingAt
	result := self parserClass parseAndCacheAll: '`a` + `b`' startingAt: 0. 
	self assert: result size equals: 1.
	self assert: result first isPetit2Success.