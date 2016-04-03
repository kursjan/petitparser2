parsing
parseOn: aPP2Context
	| context |
	^ (context := parser parseWithContext:  aPP2Context) isPetit2Failure
		ifFalse: [ context setValue: (block valueWithArguments: context value asOrderedCollection) ]
		ifTrue: [ context ]