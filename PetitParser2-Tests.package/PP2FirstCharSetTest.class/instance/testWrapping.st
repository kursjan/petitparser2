tests
testWrapping
	firstCharSet := ($a asParser2 >=> [ :c :cc | cc value ]) firstCharSet.

	self assert: firstCharSet isUnknown.
