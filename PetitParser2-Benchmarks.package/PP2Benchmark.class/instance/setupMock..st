setup & teardown
setupMock: id
	input := OrderedCollection with: 'mock'.
	parser := (nil asParser)
		name: id;
		yourself