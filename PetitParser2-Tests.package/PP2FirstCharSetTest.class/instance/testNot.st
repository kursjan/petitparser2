tests
testNot
	firstCharSet := #digit asPParser not firstCharSet.
	self should: [ firstCharSet value: $1 ] raise: Error
