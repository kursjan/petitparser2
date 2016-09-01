parsing - private
parseOld: aPP2Context
	| context |
	^ (context := parser parseWithContext:  aPP2Context) isPetit2Failure
		ifFalse: [ context setValue: (block value: context value) ]
		ifTrue: [ context ]