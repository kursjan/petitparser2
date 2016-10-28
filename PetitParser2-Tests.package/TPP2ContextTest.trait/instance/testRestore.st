tests
testRestore
	| context memento |
	context := self contextOn: 'foobar'.
	context propertyAt: #foo put: #bar.
	memento := context remember.

	context next.
	context propertyAt: #foo put: #baz.
	context propertyAt: #bar put: #baq.

	context restore: memento.
	self deny: (context hasProperty: #bar).
	self assert: (context propertyAt: #foo) equals: #bar.
	self assert: context position equals: 0.