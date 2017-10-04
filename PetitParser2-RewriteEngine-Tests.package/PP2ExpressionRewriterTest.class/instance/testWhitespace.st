testing - rewrite
testWhitespace
	self
		assert: '1+
  2'
		isRewrittenTo: '1 
  2 +'
		using: self whitespaceRpnRewriter 