parsing - private
parseOn: aPP2Context
	^ (aPP2Context atEnd not and: [ literal = aPP2Context uncheckedPeek ])
		ifFalse: [ aPP2Context failure: message ]
		ifTrue: [ aPP2Context next ]