*PetitParser2-RewriteEngine
rewriterFrom: pattern to: output named: comment
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