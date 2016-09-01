parsing
parseOn: context
	^ (context peek == literal )
		ifTrue: [ literal ] 
		ifFalse: [ PP2Failure message: 'literal expected' context: context ]