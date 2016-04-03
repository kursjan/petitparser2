parsing
parseOn: aPP2Context
	| context |
	context := aPP2Context next: self size.
	literal = context value ifTrue: [ ^ context ].
	^ aPP2Context failure: message 