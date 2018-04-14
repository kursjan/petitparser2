parsing
parseOn: context
	^ (self isEndOfLine: context) ifTrue: [ ^ nil ] ifFalse: [ failure context: context ]