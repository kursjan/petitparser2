testing - rpn rewritter
testRewriteRpnSumAfterMultiplication
	self assertRpnRewrite: '1 * 2 + 3' to: '1 * 2 3 +'.