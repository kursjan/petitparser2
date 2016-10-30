accessing
stackId
	^ stackId ifNil: [ #defaultStack ] ifNotNil: [ stackId ]