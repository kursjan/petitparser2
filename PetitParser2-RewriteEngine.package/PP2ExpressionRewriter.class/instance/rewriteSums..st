rewriting
rewriteSums: input
    ^ (self rewriterFrom: '`a` + `a`' to: '2*`a`' named: 'Sum Rewriter')
        rewriteTree: ((self parse: input) completeSource: (SmaCCString on: input))