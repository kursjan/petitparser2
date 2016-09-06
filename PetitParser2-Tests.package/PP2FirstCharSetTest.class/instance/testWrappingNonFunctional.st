tests
testWrappingNonFunctional
	firstCharSet := ($b asParser2 >==> [ :c :cc | cc value ]) firstCharSet.

	self assert: firstCharSet value: $b.

	self reject: firstCharSet value: $a.
	self reject: firstCharSet value: $c.
