running
testSetupAndRun: selector
	self testSelector: selector.
	self setupSelector: selector.
	self run.
	self teardownSelector: selector.