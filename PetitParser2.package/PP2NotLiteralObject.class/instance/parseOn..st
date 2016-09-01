parsing
parseOn: context
	^ (context peek == literal )
		ifFalse: [ nil ] 
		ifTrue: [ PP2Failure message: 'literal expected' context: context ]