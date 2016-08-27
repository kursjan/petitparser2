parsing - private
parseWithContext: aPP2Context
	^ (aPP2Context atEnd not and: [ predicate value: aPP2Context uncheckedPeek ])
		ifFalse: [ aPP2Context failure: predicateMessage  ]
		ifTrue: [ aPP2Context next ]