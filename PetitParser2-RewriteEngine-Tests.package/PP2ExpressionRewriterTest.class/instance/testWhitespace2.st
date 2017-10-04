testing - rewrite
testWhitespace2
	self
		assert: '1+
	2
	*3'
		isRewrittenTo: '1 
	2
	 3 * +'
		using: self whitespaceRpnRewriter 