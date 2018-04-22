tests
testDebug
	| debugStrategy |

	debugStrategy := strategy debug.
	
	self assert: debugStrategy debug == debugStrategy.
	