parsing
parse: input
	| startContext |
	startContext := input asPetit2Context.
	^ self parseWithContext: startContext
