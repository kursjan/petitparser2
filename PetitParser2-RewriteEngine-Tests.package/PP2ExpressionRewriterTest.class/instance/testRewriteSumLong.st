testing - rpn rewritter
testRewriteSumLong
	self assertRpnRewrite: '1 + 2 + 3' to: '1 2 3 + +'.