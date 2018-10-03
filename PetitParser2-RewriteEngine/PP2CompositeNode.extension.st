Extension { #name : #PP2CompositeNode }

{ #category : #'*PetitParser2-RewriteEngine' }
PP2CompositeNode class >> parseAndCacheAll: source startingAt: startingIndex [
	self flag: 'JK: you are ignoring starting index!'.
	
	^ Array  with: (self new enablePatternMatching parse: source)
]

{ #category : #'*PetitParser2-RewriteEngine' }
PP2CompositeNode class >> parseAndCacheAllPossibleStates: source [
	| result | 
	
	result := self new enablePatternMatching parse: source.
	self assert: result isPetit2Success.
	^ Array with: result
]

{ #category : #'*PetitParser2-RewriteEngine' }
PP2CompositeNode >> rewrite: input with: rewriter [
	^ rewriter rewriteTree: ((self parse: input) completeSource: (SmaCCString on: input))
]

{ #category : #'*PetitParser2-RewriteEngine' }
PP2CompositeNode >> rewriterFrom: pattern to: output named: comment [
	| compositeRewrite matcher transformation rewrite rewriter |
	compositeRewrite := SmaCCRewriteFile new.
	compositeRewrite parserClass: self class.
	matcher := SmaCCRewriteTreeMatch new.
	matcher source: pattern.
	transformation := SmaCCRewriteStringTransformation new.
	transformation string: output.
	rewrite := SmaCCRewrite 
		comment: comment 
		match: matcher
		transformation: transformation.
	compositeRewrite addTransformation: rewrite.
	rewriter := SmaCCRewriteEngine new.
	rewriter rewriteRule: compositeRewrite.
	^ rewriter
]
