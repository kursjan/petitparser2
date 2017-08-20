testing - rpc rewritter
testRewriteSumInParen
	self assertRpcRewrite: '(1 + 2)' to: '(1 2 +)'.