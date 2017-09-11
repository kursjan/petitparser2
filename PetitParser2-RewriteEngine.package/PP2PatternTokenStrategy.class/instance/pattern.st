parsing
pattern
	^ pattern ifNil: [ 
		pattern := self patternToken
	]