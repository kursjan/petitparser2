tests
testActionEmpty
	self assertNeverFails: nil asParser2 ==> [ :foo | foo ].	