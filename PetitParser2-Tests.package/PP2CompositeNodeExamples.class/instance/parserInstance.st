accessing
parserInstance
	^ parserInstance ifNil: [ parserInstance := self parserClass new ]