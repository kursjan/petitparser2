testing - rewrite
testCodeToRemoveParens
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'PP2ExpressionParenthesesNode
					->
					[self delete: match leftParen.
					self processChildren.
					self delete: match rightParen]').
	self
		assert: '(1)+ ( 1 +(1))'
		isRewrittenTo: '1+  1 +1'
		using: rewriter