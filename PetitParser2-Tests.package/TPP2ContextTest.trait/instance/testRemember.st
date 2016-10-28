tests
testRemember
	| context memento |
	context := self contextOn: 'foobar'.
	context propertyAt: #foo put: #bar.
	memento := context remember.

	self assert: memento position equals: context position.
	self assert: memento properties equals: context properties.

	context propertyAt: #foo put: #baz.
	self assert: (memento propertyAt: #foo) equals: #bar.