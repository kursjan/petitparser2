*PetitParser2-RewriteEngine
rewrite: input with: rewriter
	^ rewriter rewriteTree: ((self parse: input) completeSource: (SmaCCString on: input))