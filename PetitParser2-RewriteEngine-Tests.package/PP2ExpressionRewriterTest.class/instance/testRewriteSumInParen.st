testing - rpn rewritter
testRewriteSumInParen
	self assertRpnRewrite: '(1 + 2)' to: '(1 2 +)'.