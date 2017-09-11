testing - rewrite
testSumInParens
	self
		assert: '(2+3)'
		isRewrittenTo: '(2 3 +)'
		using: self rpnRewriter 