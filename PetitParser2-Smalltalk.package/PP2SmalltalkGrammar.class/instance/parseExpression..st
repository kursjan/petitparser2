parsing
parseExpression: aString 
	^ self parseExpression: aString onError: [ :msg :pos | self error: msg ]