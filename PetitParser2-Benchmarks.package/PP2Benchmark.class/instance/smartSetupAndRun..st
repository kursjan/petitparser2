setup & teardown
smartSetupAndRun: benchmarkSelector
	^ self testSetupAndRun: (benchmarkSelector removePrefix: 'benchmark')