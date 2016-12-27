tests - seas
testAnyStarLazyPredicateObject
	| parser ctx |
	parser := #any asPParser starLazy, #letter asPParser.
	parser optimize.
	parser enableDebug.
	
	ctx := self assert: parser parse: '..a'.
	self assert: ctx returnValue first asArray equals: #($. $.).
	self assert: ctx debugResult steps equals: 4.

	ctx := self assert: parser parse: 'a'.
	self assert: ctx returnValue first isEmpty.

	self assert: parser fail: '...'.
	self assert: parser fail: '...1'