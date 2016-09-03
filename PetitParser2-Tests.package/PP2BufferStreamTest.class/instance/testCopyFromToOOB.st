tests
testCopyFromToOOB
	| stream |
	stream := self streamOn: 'bar'.

	self should: [ stream copyFrom: 4 to: 4 ] raise: SubscriptOutOfBounds.
	self should: [ stream copyFrom: 1 to: 4 ] raise: SubscriptOutOfBounds.
