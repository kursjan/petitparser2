rewriting
rewriteRpn: input
    ^ self rewrite: input with: (self rpnRewriter)