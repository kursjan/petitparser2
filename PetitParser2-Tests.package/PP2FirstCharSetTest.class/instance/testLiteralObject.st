tests
testLiteralObject
	firstCharSet := $b asParser2 firstCharSet.
	self assert: firstCharSet value: $b.

	self reject: firstCharSet value: $a.
	self reject: firstCharSet value: $c.
	
	self reject: firstCharSet value: (Character codePoint: 1024).
	
