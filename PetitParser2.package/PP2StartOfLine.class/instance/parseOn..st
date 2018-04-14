parsing
parseOn: context
	^ (self isStartOfLine: context) ifTrue: [ ^ nil ] ifFalse: [ failure context: context ]