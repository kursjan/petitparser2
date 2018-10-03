Class {
	#name : #PP2ExpressionRewriter,
	#superclass : #PP2ExpressionGrammar,
	#category : 'PetitParser2-RewriteEngine-Examples'
}

{ #category : #accessing }
PP2ExpressionRewriter >> addition [
	^ super addition parseNode
		nodeClass: PP2ExpressionBinaryOperatorNode;
		nodeName: #add;
		yourself
]

{ #category : #accessing }
PP2ExpressionRewriter >> closeBracket [
	^ super closeBracket parseToken
]

{ #category : #accessing }
PP2ExpressionRewriter >> multiplication [
	^ super multiplication parseNode
		nodeName: #mult;
		yourself
]

{ #category : #accessing }
PP2ExpressionRewriter >> number [
	^ (super number ==> #asNumber) parseToken	
]

{ #category : #accessing }
PP2ExpressionRewriter >> openBracket [
	^ super openBracket parseToken
]

{ #category : #accessing }
PP2ExpressionRewriter >> parentheses [
	^ super parentheses parseNode
		nodeClass: PP2ExpressionParenthesesNode;
		nodeName: #parentheses;
		yourself
]

{ #category : #accessing }
PP2ExpressionRewriter >> plus [
	^ super plus parseToken
]

{ #category : #accessing }
PP2ExpressionRewriter >> primary [
	^ super primary parseNode
		nodeName: #primary;
		yourself
]

{ #category : #rewriting }
PP2ExpressionRewriter >> rewriteRpn: input [
    ^ self rewrite: input with: (self rpnRewriter)
]

{ #category : #rewriting }
PP2ExpressionRewriter >> rewriteSums: input [
    ^ self rewrite: input with: (self sumRewriter)
]

{ #category : #rewriting }
PP2ExpressionRewriter >> rpnRewriter [
	^ (self rewriterFrom: '`a` `op{beToken}` `b`' to: '`a` `b` `op`' named: 'RPN Rewriter')
]

{ #category : #accessing }
PP2ExpressionRewriter >> star [
	^ super star parseToken
]

{ #category : #rewriting }
PP2ExpressionRewriter >> sumRewriter [
    ^ (self rewriterFrom: '`a` + `a`' to: '2*`a`' named: 'Sum Rewriter')
]

{ #category : #accessing }
PP2ExpressionRewriter >> terms [
	^ super terms parseNode
		nodeName: #terms;
		yourself
]
