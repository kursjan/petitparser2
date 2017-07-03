accessing
pattern
	^ pattern ifNil: [ 
		pattern := self rewritePattern
	]