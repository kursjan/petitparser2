as yet unclassified
testRecognizer
	| debugStrategy |
	node := #letter asPParser.
	strategy := node strategy.
	debugStrategy := strategy debug.

	self assert: debugStrategy strategy isKindOf: PP2PredicateObject.
	
	self assert: debugStrategy recognizer == debugStrategy.
	self assert: debugStrategy strategy isKindOf: PP2PredicateObjectRecognizer.
	