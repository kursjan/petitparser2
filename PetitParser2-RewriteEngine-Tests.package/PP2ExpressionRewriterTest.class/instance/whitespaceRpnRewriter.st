accessing
whitespaceRpnRewriter
    ^ self parserInstance
        rewriterFrom: '`a` `op{beToken}` `b`'
        to: '`\a\` `\b\` `op`'
        named: 'Whitespace RPN Rewriter'