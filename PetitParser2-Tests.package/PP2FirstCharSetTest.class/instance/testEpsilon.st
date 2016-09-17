tests
testEpsilon
	firstCharSet := nil asPParser firstCharSet.

	1 to: 255 do: [ :index |
		self assert: firstCharSet value: (Character codePoint: index).
	].

	self assert: firstCharSet value: (Character codePoint: 0).
	self assert: firstCharSet value: (Character codePoint: 1234).

