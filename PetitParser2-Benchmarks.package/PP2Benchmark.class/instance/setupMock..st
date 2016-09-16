setup & teardown
setupMock: id
	input := OrderedCollection with: 'mock'.
	parser := (nil asParser2)
		name: id;
		yourself