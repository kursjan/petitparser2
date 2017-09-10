rewriting
rewriteRpn: input
	^ (self rewriterFrom: '`a` + `b`' to: '`a` `b` +' named: 'RPN Rewriter')
		rewriteTree: ((self parse: input) completeSource: (SmaCCString on: input))