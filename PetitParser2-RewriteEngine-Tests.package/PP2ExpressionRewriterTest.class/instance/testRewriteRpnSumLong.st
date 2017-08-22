testing - rpn rewritter
testRewriteRpnSumLong
	self assertRpnRewrite: '1 + 2 + 3' to: '1 2 3 + +'.