testing - rpc rewritter
testRewriteSumAfterMultiplication
	self assertRpcRewrite: '1 * 2 + 3' to: '1 * 2 3 +'.