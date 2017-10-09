testing - rewrite
testAddParens
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: PP2ExpressionRewriter
					>>>`a` `op{beToken}` `b`<<<
					->
					>>>`(a)` `op` `(b)`<<<').

	self assert: '1+1+1' isRewrittenTo: '(1) + ((1) + (1))' using: rewriter