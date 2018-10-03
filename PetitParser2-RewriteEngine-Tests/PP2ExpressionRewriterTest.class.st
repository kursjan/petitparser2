Class {
	#name : #PP2ExpressionRewriterTest,
	#superclass : #PP2CompositeNodeTest,
	#traits : 'TPP2ExpressionGrammarTest',
	#classTraits : 'TPP2ExpressionGrammarTest classTrait',
	#category : 'PetitParser2-RewriteEngine-Tests-Examples'
}

{ #category : #parsing }
PP2ExpressionRewriterTest >> assert: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass)
]

{ #category : #parsing }
PP2ExpressionRewriterTest >> assert: input isRewrittenTo: output using: pattern [
	result := self parserClass new rewrite: input with: pattern.
	self assert: result equals: output
]

{ #category : #parsing }
PP2ExpressionRewriterTest >> assertRpnRewrite: input to: output [
	self assert: input isRewrittenTo: output using: self rpnRewriter.
]

{ #category : #parsing }
PP2ExpressionRewriterTest >> assertSumsRewrite: input to: output [
	result := (self parserClass new rewriteSums: input).
	self assert: result equals: output
]

{ #category : #parsing }
PP2ExpressionRewriterTest >> parsePattern: patternInput rule: aSymbol [
	| production |
	production := (self parserInstanceFor: aSymbol) enablePatternMatching.
	^ self parse: patternInput production: production to: nil end: patternInput size checkResult: false
]

{ #category : #accessing }
PP2ExpressionRewriterTest >> parserClass [
	^ PP2ExpressionRewriter 
]

{ #category : #accessing }
PP2ExpressionRewriterTest >> parserInstance [
	^ self parserClass new
]

{ #category : #accessing }
PP2ExpressionRewriterTest >> rewriterFrom: input to: output [
	^ self parserClass new rewriterFrom: input to: output named: 'Testing'
]

{ #category : #accessing }
PP2ExpressionRewriterTest >> rpnRewriter [
	^ self parserInstance rpnRewriter 
]

{ #category : #accessing }
PP2ExpressionRewriterTest >> sumRewriter [
	^ self parserInstance sumRewriter 
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testAddParens [
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
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testCodeExpressionToRemoveParens [
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'Parser: PP2ExpressionRewriter
					>>>`a{testBlock: [:node | node isKindOf: PP2ExpressionParenthesesNode ]}`<<<
					->
					>>>``self delete: match leftParen.
						  self processChildren.
						  self delete: match rightParen``<<<').
	self
		assert: '(1)+ ( 1 +(1))'
		isRewrittenTo: '1+  1 +1'
		using: rewriter
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testCodeToRemoveParens [
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
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testMultipleInsertAfters [
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
							[self insert: ''()'' after: match.
							self insert: ''[]'' after: match].
					self continue]').
				
	self assert: '1+2+3' isRewrittenTo: '1+2+3()[]()[]' using: rewriter
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testMultipleInsertBefores [
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
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testNoChanges [	
	self assert: '1' isRewrittenTo:'1' using: self rpnRewriter
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testOneExpression [
	self
		assert: '2+3'
		isRewrittenTo: '2 3 +'
		using: self rpnRewriter.
		
	self
		assert: '2*3'
		isRewrittenTo: '2 3 *'
		using: self rpnRewriter 
]

{ #category : #tests }
PP2ExpressionRewriterTest >> testParseAndCacheAllStartingAt [
	result := self parserClass parseAndCacheAll: '`a` + `b`' startingAt: 0. 
	self assert: result size equals: 1.
	self assert: result first isPetit2Success.
]

{ #category : #'testing - pattern' }
PP2ExpressionRewriterTest >> testPatternExpression [
	| addition bPattern |
	self parsePattern: '`a` + `b`' rule: #terms.
	
	addition := result children first.
	self assert: addition name = 'add'.
	
	bPattern := addition children third.
	self assert: bPattern isKindOf: PP2PatternParseNode.
	self assert: bPattern name = 'b'.
]

{ #category : #'testing - pattern' }
PP2ExpressionRewriterTest >> testPatternExpressionLong [
	self parsePattern: '`a` + `b` + `c`' rule: #terms.
]

{ #category : #'testing - pattern' }
PP2ExpressionRewriterTest >> testPattern_addition [
	self parsePattern: '`a`' rule: #addition.
	self assert: result children first isKindOf: PP2PatternToken.
	self parse: '1 + 2' rule: #addition.
	self assert: result children first isKindOf: PP2ParseNode
]

{ #category : #'testing - pattern' }
PP2ExpressionRewriterTest >> testPattern_multiplication [
	self parsePattern: '`a`' rule: #multiplication.
	self assert: result children first isKindOf: PP2PatternToken.
	self parse: '1 * 2' rule: #multiplication.
	self assert: result children first isKindOf: PP2ParseNode
]

{ #category : #'testing - pattern' }
PP2ExpressionRewriterTest >> testPattern_number [
	self parsePattern: '`a`' rule: #number.
	self assert: result isPatternParseNode.
	self assert: result name = 'a'.
	
	self parse: '1' rule: #number.
	self assert: result isKindOf: PP2Token
]

{ #category : #'testing - rpn rewritter' }
PP2ExpressionRewriterTest >> testRewriteRpnDeep [
	self assertRpnRewrite: '(1 + 2) + (3 + 4)' to: '(1 2 +)  (3 4 +) +'.
]

{ #category : #tests }
PP2ExpressionRewriterTest >> testRewriteRpnSumAfterMultiplication [
	self assertRpnRewrite: '1 * 2 + 3' to: '1 2 3 + *'.
]

{ #category : #'testing - rpn rewritter' }
PP2ExpressionRewriterTest >> testRewriteRpnSumInParen [
	self assertRpnRewrite: '(1 + 2)' to: '(1 2 +)'.
]

{ #category : #'testing - rpn rewritter' }
PP2ExpressionRewriterTest >> testRewriteRpnSumLong [
	self assertRpnRewrite: '1 + 2 + 3' to: '1 2 3 + +'.
]

{ #category : #'testing - sums rewriter' }
PP2ExpressionRewriterTest >> testRewriteSumsSumDistinct [
	self assertSumsRewrite: '1 + 2' to: '1 + 2'.
]

{ #category : #'testing - sums rewriter' }
PP2ExpressionRewriterTest >> testRewriteSumsSumSame [
	self assertSumsRewrite: '1 + 1' to: '2*1'.
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testSumInParens [
	self
		assert: '(2+3)'
		isRewrittenTo: '(2 3 +)'
		using: self rpnRewriter 
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testTwoExpressions [
	self
		assert: '1+2*3'
		isRewrittenTo: '1 2 3 * +'
		using: self rpnRewriter
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testTypeAddParens [
	| rewriter |
	rewriter := SmaCCRewriteEngine new.
	rewriter
		rewriteRule:
			(SmaCCRewriteRuleFileParser
				parse:
					'PP2ExpressionBinaryOperatorNode
					->
					>>>`(left)` `operator` `(right)`<<<').
	self
		assert: '1+1+1'
		isRewrittenTo: '(1) + ((1) + (1))'
		using: rewriter
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testWhitespace [
	self
		assert: '1+
  2'
		isRewrittenTo: '1 
  2 +'
		using: self whitespaceRpnRewriter 
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testWhitespace2 [
	self
		assert: '1+
	2
	*3'
		isRewrittenTo: '1 
	2
	 3 * +'
		using: self whitespaceRpnRewriter 
]

{ #category : #'testing - rewrite' }
PP2ExpressionRewriterTest >> testWithParens [
	self
		assert: '1+(2+3)'
		isRewrittenTo: '1 (2 3 +) +'
		using: self rpnRewriter 
]

{ #category : #accessing }
PP2ExpressionRewriterTest >> whitespaceRpnRewriter [
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
]
