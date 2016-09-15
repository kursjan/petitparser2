tests
testWrappingNonFunctionalEpsilon
	parser := nil asParser2 >==> [:c :cc | cc value].

	self assertIsNullable: parser
