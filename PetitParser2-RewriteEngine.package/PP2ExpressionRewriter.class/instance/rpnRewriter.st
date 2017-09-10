rewriting
rpnRewriter
	^ (self rewriterFrom: '`a` `op` `b`' to: '`a` `b` `op`' named: 'RPN Rewriter')