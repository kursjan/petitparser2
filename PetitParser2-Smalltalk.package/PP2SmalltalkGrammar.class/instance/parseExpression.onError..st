parsing
parseExpression: aString onError: aBlock
	^ startExpression parse: aString onError: aBlock