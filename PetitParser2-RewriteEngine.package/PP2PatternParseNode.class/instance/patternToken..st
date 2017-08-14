accessing
patternToken: aPP2RewriteToken
	self assert: patternToken isNil.
	
	children := OrderedCollection  with: aPP2RewriteToken.
	patternToken := aPP2RewriteToken