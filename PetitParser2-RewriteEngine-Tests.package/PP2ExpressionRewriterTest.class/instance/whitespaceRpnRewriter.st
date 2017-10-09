accessing
whitespaceRpnRewriter
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: PP2ExpressionRewriter
					>>>`a` `op{beToken}` `b`<<<
					->
					>>>`\a\` `\b\` `op`<<<').
	^ rewriter