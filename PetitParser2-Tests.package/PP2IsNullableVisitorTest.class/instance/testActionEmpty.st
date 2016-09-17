tests
testActionEmpty
	self assertIsNullable: nil asPParser ==> [ :foo | foo ].	