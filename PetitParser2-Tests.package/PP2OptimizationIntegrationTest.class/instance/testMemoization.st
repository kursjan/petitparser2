tests
testMemoization
	| id |
	id := #any asPParser, #word asPParser star.
	id memoize.
	
	parser := id / id optional.
	parser optimize.
	
	self assert: id strategy isKindOf: PP2Packrat.