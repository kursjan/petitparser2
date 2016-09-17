setup & teardown
setupMock: id
	input := OrderedCollection with: 'mock'.
	parser := (nil asPParser)
		name: id;
		yourself