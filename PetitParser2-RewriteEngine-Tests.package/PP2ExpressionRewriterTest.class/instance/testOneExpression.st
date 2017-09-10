testing - rewrite
testOneExpression
	self
		assert: '2+3'
		isRewrittenTo: '2 3 +'
		using: self rpnRewriter.
		
	self
		assert: '2*3'
		isRewrittenTo: '2 3 *'
		using: self rpnRewriter 