testing - rpc rewritter
testRewriteSumLong
	self assertRpcRewrite: '1 + 2 + 3' to: '1 2 3 + +'.