tests
testAnyStarLazyPredicateObject
	| starLazy predicate |
	starLazy := #any asPParser starLazy.
	predicate := #letter asPParser.
	parser := starLazy, predicate.
	
	starLazy child updateAfterWater: parser.
	starLazy child updateBeforeWater: parser.
		
	visitor visit: parser.
	self assert: starLazy strategy isKindOf: PP2AnyStarLazyPredicateObject.
	self assert: starLazy strategy predicate equals: predicate predicate.