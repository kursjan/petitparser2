testing - rpn rewritter
testRewriteRpnDeep
	self assertRpnRewrite: '(1 + 2) + (3 + 4)' to: '(1 2 +)  (3 4 +) +'.