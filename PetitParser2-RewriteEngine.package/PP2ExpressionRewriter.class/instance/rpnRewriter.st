rewriting
rpnRewriter
	^ (self rewriterFrom: '`a` `op{beToken}` `b`' to: '`a` `b` `op`' named: 'RPN Rewriter')