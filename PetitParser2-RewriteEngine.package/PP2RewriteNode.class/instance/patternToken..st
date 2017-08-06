accessing
patternToken: aPP2RewriteToken
	self assert: children isNil.
	self assert: patternToken isNil.
	
	patternToken := aPP2RewriteToken.
	children := OrderedCollection  with: aPP2RewriteToken 