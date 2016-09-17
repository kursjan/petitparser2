tests
testWrappingNonFunctionalEpsilon
	parser := nil asPParser >==> [:c :cc | cc value].

	self assertIsNullable: parser
