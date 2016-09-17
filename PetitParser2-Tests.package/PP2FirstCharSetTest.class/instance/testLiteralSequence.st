tests
testLiteralSequence
	firstCharSet := 'foobar' asPParser firstCharSet.
	self assert: firstCharSet value: $f.

	self reject: firstCharSet value: $e.
	self reject: firstCharSet value: $o.
	self reject: firstCharSet value: $b.
	
	self reject: firstCharSet value: 1024.
	
