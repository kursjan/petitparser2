tests
testMemo
	| context memento |
	context := self contextOn: 'foobar'.
	context propertyAt: #foo put: #bar.
	memento := context remember.

	context next.
	context propertyAt: #bar put: #baz.
	context propertyAt: #foo put: #bark.

	context restore: memento.
	self assert: context position equals: 0.
	self deny: (context hasProperty: #bar).
	self assert: (context propertyAt: #foo) equals: #bar.