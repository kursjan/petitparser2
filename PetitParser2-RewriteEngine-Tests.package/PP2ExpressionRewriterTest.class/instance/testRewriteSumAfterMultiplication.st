testing - rpn rewritter
testRewriteSumAfterMultiplication
	self assertRpnRewrite: '1 * 2 + 3' to: '1 * 2 3 +'.