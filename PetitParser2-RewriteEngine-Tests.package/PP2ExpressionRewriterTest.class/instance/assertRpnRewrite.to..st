parsing
assertRpnRewrite: input to: output
	self assert: input isRewrittenTo: output using: self rpnRewriter.