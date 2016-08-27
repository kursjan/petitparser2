parsing - private
parseWithContext: startContext
	| context |
	context := startContext next: size.
	^ (context value isNil not and: [ predicate value: context value]) 
		ifTrue: [ context ]
		ifFalse: [ startContext failure: predicateMessage ]