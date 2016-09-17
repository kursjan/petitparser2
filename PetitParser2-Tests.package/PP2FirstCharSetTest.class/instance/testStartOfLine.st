tests
testStartOfLine
	firstCharSet := #startOfLine asPParser firstCharSet.

	self should: [ firstCharSet value: $1 ] raise: Error
