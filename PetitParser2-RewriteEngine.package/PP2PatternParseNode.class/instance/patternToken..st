accessing
patternToken: token
	self assert: patternToken isNil.
	
	children := OrderedCollection  with: token.
	patternToken := token