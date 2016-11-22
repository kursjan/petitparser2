as yet unclassified
testDebug
	| debugStrategy |

	debugStrategy := strategy debug.
	
	self assert: debugStrategy debug == debugStrategy.
	