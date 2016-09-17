tests
testPluggable
	firstCharSet := ([ :c | c next ] asPParser) firstCharSet.
	self assert: firstCharSet isUnknown.
