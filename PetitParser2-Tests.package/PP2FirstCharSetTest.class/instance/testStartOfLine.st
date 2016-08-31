tests
testStartOfLine
	firstCharSet := #startOfLine asParser2 firstCharSet.

	self should: [ firstCharSet value: $1 ] raise: Error
