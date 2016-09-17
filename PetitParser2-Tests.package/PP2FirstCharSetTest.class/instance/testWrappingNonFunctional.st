tests
testWrappingNonFunctional
	firstCharSet := ($b asPParser >==> [ :c :cc | cc value ]) firstCharSet.

	self assert: firstCharSet value: $b.

	self reject: firstCharSet value: $a.
	self reject: firstCharSet value: $c.
