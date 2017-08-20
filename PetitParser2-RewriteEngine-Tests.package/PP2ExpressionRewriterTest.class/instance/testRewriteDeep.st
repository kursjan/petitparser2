testing - rpc rewritter
testRewriteDeep
	self assertRpcRewrite: '(1 + 2) + (3 + 4)' to: '(1 2 +)  (3 4 +) +'.