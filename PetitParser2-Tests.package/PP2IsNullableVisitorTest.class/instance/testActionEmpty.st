tests
testActionEmpty
	self assertIsNullable: nil asParser2 ==> [ :foo | foo ].	