rewriting
rewriteRpn: input
	| compositeRewrite matcher transformation rewrite rewriter |
	compositeRewrite := SmaCCRewriteFile new.
	compositeRewrite parserClass: self class.
	matcher := SmaCCRewriteTreeMatch new.
	matcher source: '`a` + `b`'.
	transformation := SmaCCRewriteStringTransformation new.
	transformation string: '`a` `b` +'.
	rewrite := SmaCCRewrite 
		comment: 'Postfix rewriter' 
		match: matcher
		transformation: transformation.
	compositeRewrite addTransformation: rewrite.
	rewriter := SmaCCRewriteEngine new.
	rewriter rewriteRule: compositeRewrite.
	^ rewriter rewriteTree: ((self parse: input) completeSource: (SmaCCString on: input))