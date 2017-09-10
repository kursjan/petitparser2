rewriting
rewriteSums: input
    ^ self rewrite: input with: (self sumRewriter)