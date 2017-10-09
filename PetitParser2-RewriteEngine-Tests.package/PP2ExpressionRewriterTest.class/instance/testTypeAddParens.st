testing - rewrite
testTypeAddParens
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: SmaCCRewriteTestParser
					PP2ExpressionBinaryOperatorNode
					->
					>>>`(left)` `operator` `(right)`<<<').
	self
		assert: '1+1+1'
		isRewrittenTo: '(1) + ((1) + (1))'
		using: rewriter