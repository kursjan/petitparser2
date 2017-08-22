testing - rpn rewritter
testRewriteRpnSumInParen
	self assertRpnRewrite: '(1 + 2)' to: '(1 2 +)'.