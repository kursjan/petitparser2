parsing
pattern
	^ pattern ifNil: [ 
		pattern := self rewritePattern
	]