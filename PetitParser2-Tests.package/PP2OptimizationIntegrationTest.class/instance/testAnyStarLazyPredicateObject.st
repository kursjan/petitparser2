tests
testAnyStarLazyPredicateObject
	parser := #any asPParser starLazy, #word asPParser.
	
	parser optimize.
	
	self assert: parser firstChild strategy isKindOf: PP2AnyStarLazyPredicateObject.