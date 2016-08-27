running
testSetupAndRun: runSelector
	self testSelector: runSelector.
	self setupSelector: runSelector.
	self run.
	self teardownSelector: runSelector.