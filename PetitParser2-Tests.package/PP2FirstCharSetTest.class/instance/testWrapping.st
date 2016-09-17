tests
testWrapping
	firstCharSet := ($a asPParser >=> [ :c :cc | cc value ]) firstCharSet.

	self assert: firstCharSet isUnknown.
