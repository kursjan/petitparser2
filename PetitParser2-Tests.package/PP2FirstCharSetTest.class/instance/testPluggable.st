tests
testPluggable
	firstCharSet := ([ :c | c next ] asParser2) firstCharSet.
	self assert: firstCharSet isUnknown.
