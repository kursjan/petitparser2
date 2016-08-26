parsing
parseMethod: aString 
	^ self parseMethod: aString onError: [ :msg :pos | self error: msg ]