testing - rewrite
testMultipleInsertBefores
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'PP2ExpressionBinaryOperatorNode
					->
					[match parent notNil 
						ifTrue:
							[self insert: ''[]'' before: match.
							self insert: ''()'' before: match].
					self continue]').
				
	self assert: '1+2+3' isRewrittenTo: '()[]1+()[]2+3' using: rewriter