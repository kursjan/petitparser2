tests
testNot
	firstCharSet := #digit asParser2 not firstCharSet.
	self should: [ firstCharSet value: $1 ] raise: Error
