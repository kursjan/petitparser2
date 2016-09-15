parsing
parseOn: context
	^ context atEnd ifTrue: [ nil ] ifFalse: [ failure context: context ]